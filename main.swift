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
    private var deck:Deck!
    init(title:String,content:String, date:Date,priority:Int,deck:Deck){
        self.title = title
        self.content = content
        self.date = date
        self.priority = priority
        self.deck = deck
    }
    public func getTitle()-> String{
        return self.title
    }
    public func getDate()-> Date{
        return self.date
    }
    public func getContent()-> String{
        return self.content
    }
    public func getPriority()-> Int{
        return self.priority
    }
    
    public func deleteTodo(){
        // to delete from deck and allTodos
    }
    public func editTodo(){
        
    }
}
func startMenu(){
    let deck = Deck(name:"deck1")
    let todo = Todo(title:"1",content:"cont",date:Date(),priority:0,deck:deck)
    deck.addTodo(todo:todo)
    print(deck.getName())
    print(todo.getTitle())
}
public func sort(array:Array<Todo>,type:String) -> Array<Todo> {
    // to sort array
    // type can be : date,title,priority
    return []
}
startMenu()