# OS Lab7 实验报告
### 练习0
#P14206024  曹立
1. 	<b>添加lab1~lab6原有代码，并进行适当更新。</b>

	> * trap_dispatch() in trap.c
	```
	ticks ++;
	run_timer_list();
	```

### 练习1
---
1.	<b>给出内核级信号量的设计描述，并说其大致执行流程</b>
	
	- 信号量主要由up和down函数操作，分别对应V和P操作：

	> * up函数

	```
	static __noinline void __up(semaphore_t *sem, uint32_t wait_state) {
    bool intr_flag;
    local_intr_save(intr_flag); //关中断 保证原子操作
    {
        wait_t *wait; //获取wait进程
        //取得队列中正在等待此信号量的进程
        if ((wait = wait_queue_first(&(sem->wait_queue))) == NULL) {
            //若没有等待
            sem->value ++; //将信号量可用值加一
        }
        else { //若有等待
            //sem->value+1
            //sem->value-1
            wakeup_wait(&(sem->wait_queue), wait, wait_state, 1); //唤醒队列等待进程
        }
    }
    local_intr_restore(intr_flag);
	}
	```

	> * down函数
	```
	static __noinline uint32_t __down(semaphore_t *sem, uint32_t wait_state) {
    bool intr_flag;
    local_intr_save(intr_flag);//关中断
    if (sem->value > 0) {//检测是否有可用资源
        sem->value --;//有可用资源直接分配并返回
        local_intr_restore(intr_flag);
        return 0;
    }
    	//进行至此处说明没有可用资源 需要等待
    wait_t __wait, *wait = &__wait;
    wait_current_set(&(sem->wait_queue), wait, wait_state);//加入等待此sem的队列 并变为sleep
    local_intr_restore(intr_flag);
    schedule();//调用其他能够执行的进程
    	//进行至此处刚刚被V操作环形 说明有可用资源
    local_intr_save(intr_flag);//关中断
    wait_current_del(&(sem->wait_queue), wait);//从等待队列中取出
    //直接获得sem 不用对value进行操作
    local_intr_restore(intr_flag);
    if (wait->wakeup_flags != wait_state) {
        return wait->wakeup_flags;
    }
    return 0;
	}
	```

### 练习2
---
1.	<b>用管程机制实现哲学家就餐问题的解决方案</b>
	
	> * cond_signal() in monitor.c 当前进程改变了所需求的条件 需要转移控制进行测试
	```
	 if(cvp->count>0) {
        cvp->owner->next_count ++;
        up(&(cvp->sem));
        down(&(cvp->owner->next));
        cvp->owner->next_count --;
      }
	```

	> * cond_wait() in monitor.c 当前程序所需求的条件不满足 需要转移控制
	```
	cvp->count++;
      if(cvp->owner->next_count > 0)
         up(&(cvp->owner->next));
      else
         up(&(cvp->owner->mutex));
      down(&(cvp->sem));
      cvp->count --;
	```

	> * phi_take_forks_condvar() in check_sync.c 根据注释完成代码即可，哲学家是饥饿的，如果左右都没有在吃饭，那么他就进入吃的状态，如果不满足条件，那么他进入等待。
	```
	state_condvar[i]=HUNGRY; 
      phi_test_condvar(i); 
      while (state_condvar[i] != EATING) {
          cprintf("phi_take_forks_condvar: %d didn't get fork and will wait\n",i);
          cond_wait(&mtp->cv[i]);
    }
	```

	> * phi_put_forks_condvar() in check_sync.c 哲学家放下筷子进行思考，对于他左右两边的人进行检测是否满足可以吃饭的要求。
	```
	state_condvar[i]=THINKING;
    phi_test_condvar(LEFT);
    phi_test_condvar(RIGHT);
	```
