
class TodoService {  

    constructor(todoRepository){
        this.todoRepository=todoRepository
    }

    create(todoText){
        this.todoRepository.insert(todoText)
    }

    getOneTodo(id){
        return this.todoRepository.getById(id);
    }

    getAllTodos(){
        return this.todoRepository.getAll();
    }
}

module.exports = {TodoService}