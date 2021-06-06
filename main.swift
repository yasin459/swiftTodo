import Foundation
public class Deck{
    public static var allDecks = [Deck]()
    private var name:String = ""
    private var todos = [Todo]()
    
    init(name:String){
        self.name = name
    }
    public func getName()-> String{
        return self.name
    }
    public func addTodo(todo:Todo){
        self.todos.append(todo)
    }
}
public class Todo{
    public static var allTodos = [Todo]()
    private var title:String = ""
    private var content:String = ""
    private var date:Date!
    private var priority:Int!
    init(title:String,content:String, date:Date,priority:Int){
        self.title = title
        self.content = content
        self.date = date
        self.priority = priority
    }
    public func getTitle()-> String{
        return self.title
    }
}
func startMenu(){
    let todo = Todo(title:"1",content:"cont",date:Date(),priority:0)
    print(todo.getTitle())
}
startMenu()