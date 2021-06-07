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
    public static func getDick(name:String){
        
    }
}
public class Todo{
    public static var allTodos = [Todo]()
    private var title:String = ""
    private var content:String = ""
    private var date:Date!
    private var priority:Int!
    private var deck:Deck!
    init(title:String,content:String, date:Date,priority:Int){
        self.title = title
        self.content = content
        self.date = date
        self.priority = priority
    }
    public func getTitle()-> String{
        return self.title
    }
    public func getDate()-> Date{
        return self.date
    }
    public func setDeck(deck:Deck){
        self.deck = deck
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
    public static func getTodo(title:String){
        
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
        print("startMenu, please choose a number:\n" +
            "1.Todo Menu\n" +
            "2.Deck Menu\n" + 
            "3.end\n")
        let input:String! = readLine()
        if input.trim()=="3"{
            print("bye:)")       
            return
        }else if input.trim() == "1"{
            todoMenu()
        }else if input.trim() == "2"{
            deckMenu()
        }
        else {
            print("****wrong input****\n")
        }
    }
}
func todoMenu(){
    while(true){
        print("todoMenu, please choose a number:\n" +
            "1.add todo\n" +
            "2.show all todos\n" + 
            "3.back\n")
        let input:String! = readLine()
        if input.trim()=="3"{
            return
        }else if input.trim() == "1"{
            addTodo()
        }else if input.trim() == "2"{
            showAllTodos()
        }
        else {
            print("****wrong input****\n")
        }    
    }
    
}
func addTodo(){
    print("please enter title: ")
    let title:String! = readLine()
    print("please enter content: ")
    let content:String! = readLine()
    print("please enter preiority as a integer: ")
    let priority:String! = readLine()
    if !titleCheck(title:title.trim()) {
        print("****wrong input: title already exists****\n")
    }else if priority.trim().isInt{
        let num:Int! = Int(priority.trim())
        Todo.allTodos.append(Todo(title:title.trim(),content:content.trim(),date:Date(),priority:num))
        print("****successful: todo added****\n")
    }
    else{
        print("****wrong input for preiority****\n")
    }
}
func titleCheck(title:String)->Bool{
    for item in Todo.allTodos{
        if item.getTitle() == title {
            return false
        }
    }
    return true
}
func nameCheck(name:String)->Bool{
    for item in Deck.allDecks{
        if item.getName() == name {
            return false
        }
    }
    return true
}
func showAllTodos(){
    //todo dorrin
}
func deckMenu(){
    while(true){
        print("deckMenu, please choose a number:\n" +
            "1.add deck\n" +
            "2.show all decks\n" + 
            "3.back\n")
        let input:String! = readLine()
        if input.trim()=="3"{
            return
        }else if input.trim() == "1"{
            addDeck()
        }else if input.trim() == "2"{
            showAllDecks()
        }
        else {
            print("****wrong input****\n")
        }    
    }
}
extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
public func addDeck(){
    print("please enter name: ")
    let name:String! = readLine()
    if !nameCheck(name:name.trim()) {
        print("****wrong input: name already exists****\n")
    }
    else{
        Deck.allDecks.append(Deck(name:name.trim()))
        print("****successful: deck added****\n")

    }
    
}
public func showAllDecks(){
    //todo dorrin
}
public func sort(array:Array<Todo>,type:String,order:String) -> Array<Todo> {
    // to sort array
    // type can be : date,title,priority
    // order is assce or desce
    return []
}
startMenu()
