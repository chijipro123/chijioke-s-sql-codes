
#initial task description list
task_des= []

# function to display tasks in order
def display_task(all_tasks):
    print("\n printing your task to do")
    if len(all_tasks) <= 0:
        print("there is no task to remove")
    else:
       for index,task in enumerate(all_tasks):
        print(f'{index+1}: {task}')
        

#select menu for all task to do
def select_task(all_tasks):
    select_task = input("Enter 'A' to add a new task,Enter 'E' to edit the existing task, ")
    select_task = input("'R' to remove the task,'V' to view all tasks, 'C'to cancel the app: ")
    if select_task == 'A':
        add_task(all_tasks)
    elif select_task == 'E':
        edit_task(all_tasks)
    elif select_task == 'R':
        remove_task(all_tasks)
    elif select_task == 'V':
         view_task(all_tasks)
    elif select_task == 'C':
        return
    else:
        select_task(all_tasks)
        
 #function removing tasks using the number of task       
def remove_task(all_tasks):
    number_task = input("please,Enter number of the task to remove here! ")
    all_tasks.remove(all_tasks[int(number_task)-1])
    print(f'{number_task}removed!')
    
    #calling a function to display task removed and select another task
    display_task(all_tasks)
    select_task(all_tasks)
 
# function to edit the existing task to new task  
def edit_task(all_tasks):
    number_task = input("please,Enter number of the task to edit here! " )
    new_task = input('edit_task: ')
    all_tasks[int(number_task)-1] == new_task
    print(f'{number_task} edited!')
    
    #calling a function to display task edited and select another task
    display_task(all_tasks)
    select_task(all_tasks)
# function to view the list format sorted by deadline in days
def view_task(all_tasks):
    print("Enter deadline number of days to finish this task? ")     
    deadline_task = int(input(">")) 
    for deadline_task,task in enumerate(all_tasks):  
            print(f'{deadline_task+1}: {task}')
            print("\n")
    
#function asking the user to input the description task, priority level and deadline set for in days  
def add_task(all_tasks):
    print("Add a describe the task you want to do? ")
    task_description = input(">")
    all_tasks.append(task_description)  
    print("\n")
    print("\n")
    print("Add a priority level for this task Green=low Yellow=medium Red=high? ")
    priority_level = input(">")
    all_tasks.append(priority_level) 
    print("\n")
    print("\n") 
    print("Add deadline number of days to finish this task? ")     
    deadline_task = int(input(">"))
    all_tasks.append(deadline_task)  
    
    #calling function to display task and to select task to do  
    display_task(all_tasks)
    select_task(all_tasks)
 
#start application
add_task(task_des)
