##练习1:
实现first-fit连续物理内存分配算法(需要编程)在实现firstfit内存分配算法的回收函数时,要考虑地址连续的空闲块之间的合并操作。提示:在建立空闲页块链表时,需要按照空闲页块起始地址来排序,形成一个有序的链表。可能会修改default_pmm.c中的defaultinit,default_init_memmap,default_alloc_pages,default_free_pages等相关函数。请仔细查看和理解default_pmm.c中的注释.


pmm_manager:在这个框架里设置一个连续物理内存分配算法主要的一些函数实现 。
	＊alloc  ＊free重点实现 ，分配和释放 
	前面的init_memmap来实现物理内存有效感知的一些初始化工作。
 	check函数得到当前剩余多少页。
	这个函数答题形成来我们的pmm_manager
nit_memmap(struct Page *base, size_t n)
p->flags = 0; SetPageProperty(p);

default_alloc_pages(size_t n)修改list_entry_t *le, *len;
    le = &free_list;

    while((le=list_next(le)) != &free_list) {
      struct Page *p = le2page(le, page_link);
      if(p->property >= n){
        int i;
        for(i=0;i<n;i++){
          len = list_next(le);
          struct Page *pp = le2page(le, page_link);
          SetPageReserved(pp);
          ClearPageProperty(pp);
          list_del(le);
          le = len;
        }
        if(p->property>n){
          (le2page(le,page_link))->property = p->property - n;
        }
        ClearPageProperty(p);
        SetPageReserved(p);
        nr_free -= n;
        return p;
      }
    }
    return NULL;
}

default_free_pages(struct Page *base, size_t n) 修改 assert(PageReserved(base));

    list_entry_t *le = &free_list;
    struct Page * p;
    while((le=list_next(le)) != &free_list) {
      p = le2page(le, page_link);
      if(p>base){
        break;
       p = le2page(le,page_link) ;
    if( base+n == p ){
      base->property += p->property;
      p->property = 0;
    }
    le = list_prev(&(base->page_link));
    p = le2page(le, page_link);
    if(le!=&free_list && p==base-1){
      while(le!=&free_list){
        if(p->property){
          p->property += base->property;
          base->property = 0;
          break;
        }
        le = list_prev(le);
        p = le2page(le,page_link);
      }
fist fit : 当找到的block比请求的大的话,就分割这个block将剩余的插入到free list中.我们可以看到,这样的话会使得前面的block越来越小,从而导致每次搜索都会越来越远. 

##练习2:实现寻找虚拟地址对应的页表项(需要编程)
通过设置页表和对应的页表项,可建立虚拟内存地址和物理内存地址的对应关系。其中的get_pte函数是设置页表项环节中的
一个重要步骤。此函数找到一个虚地址对应的二级页表项的内核虚地址,如果此二级页表项不存在,则分配一个包含此项的
二级页表。本练习需要补全get_pte函数	in	kern/mm/pmm.c,实现其功能。

get-pre函数  pde_t *pdep = &pgdir[PDX(la)]; //找到页目录入口
    if (!(*pdep & PTE_P)) {							    //检查是否是当前入口
        struct Page *page;			           //检查是否需要
        if (!create || (page = alloc_page()) == NULL) {    ／／设定页的设置
            return NULL;									           
        }
        set_page_ref(page, 1);
        uintptr_t pa = page2pa(page);		          //用memset设置页内容         memset(KADDR(pa), 0, PGSIZE);
        *pdep = pa | PTE_U | PTE_W | PTE_P;	
    }
    return &((pte_t *)KADDR(PDE_ADDR(*pdep)))[PTX(la)];//返回页表入口}

在一级页表中查找二级页表：pde_t *pdepage=&pgdir[PDX(la)]； 如果二级页表不存在，即：(*pdepage & PTE_P)==0； 再看是否需要创建， 如果需要创建， 那么申请一页新的物理页： page = alloc_page() 然后设置映射标志：set_page_ref(p, 1)； 清零：uintptr_t pa =KADDR(page2pa(page))； memset(pa, 0, PGSIZE)； 设置用户权限：*pdepage = page2pa(p) | PTE_USER； 如果已经存在了，那么可以直接返回它的物理地址： return &((pte_t*)KADDR(PDE_ADDR(*pdepage)))[PTX(la)]

请描述目录项(Pag	Director	Entry)和页表(Page	Table	Entry)中每个组成部分的含义和以及对ucore而言的潜在用
处。


如果ucore执行过程中访问内存,出现了页访问异常,请问硬件要做哪些事情?




练习3:释放某虚地址所在的页并取消对应二级页表项的映射(需要编程)
当释放一个包含某虚地址的物理内存页时,需要让对应此物理内存页的管理数据结构Page做相关的清除处理,使得此物理内
存页成为空闲;另外还需把表示虚地址与物理地址对应关系的二级页表项清除。请仔细查看和理解page_remove_pte函数中的注释。为此,需要补全在	kern/mm/pmm.c中的page_remove_pte函数。page_remove_pte函数的调用关系图如下所示:
	page_remove_pte函数 
	if (*ptep & PTE_P) {						//检查是否当前也表
        struct Page *page = pte2page(*ptep);	//找到相应页
        if (page_ref_dec(page) == 0) {		            //
            free_page(page);									   //清理页
        }
        *ptep = 0;
        tlb_invalidate(pgdir, la);			//也表
    }
}

	释放一个二级页表首先要看看它是否还映射到了其他页上，如果有映射，那 么就不能释放。这个判断的函数在 pmm.h 中有定义： static inline int page_ref_dec(struct Page *page) { return atomic_sub_return(&(page->ref), 1); } 也就是将映射变量减一：page_ref_dec(page)，观察返回值，如果为 0，那么就说 明 pte 没有再映射到其他页，可以释放： if (page_ref_dec(p) == 0) free_pages(p, 1); 同时每次释放或添加页的时候都要更新一次 TLB 表：tlb_invalidate(pgdir, la)。



