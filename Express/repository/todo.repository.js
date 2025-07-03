const todoList = []

class TodoRepository{

    insert(todoText){
        todoList.push({id:todoList.length,Text:todoText})
    }

    getAll(){
        return todoList
    }

    getById(id){
        todoList.filter((todo)=>todo.id===id)[0]
    }
}

module.exports = {TodoRepository}