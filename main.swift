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
extension String
{   
    func trim() -> String
   {
    return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
   }
}
func startMenu(){
    while(true){
        print("hi, please enter one of options below(or type\"end\" to exit):\n" +
            "1.add deck #name\n" +
            "2.show deck #name\n" + 
            "3.show all todos\n" +
            "4.show all decks\n" +
            "5.add todo #deckName(type \"_\" if no deck) #title #priority #content\n" +
            "6.delete todo #deckName(type \"_\" if no deck)  #title\n" +
            "7.edit todo #deckName(may be empty)  #title\n" +
            "8.end\n")
        let input:String! = readLine()
        if input.trim()=="end"{
            print("bye:)")       
            return
        }else {
            print("****wrong input****\n")
        }
    }
}
public func sort(array:Array<Todo>,type:String,order:String) -> Array<Todo> {
    // to sort array
    // type can be : date,title,priority
    // order is assce or desce
    return []
}
startMenu()