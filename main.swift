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
    public func getTodos()-> [Todo]{
        return self.todos
    }
    public func addTodo(todo:Todo){
        self.todos.append(todo)
    }
    public func deleteTodo(todoToDelete: Todo) {
        self.todos = self.todos.filter() {
            $0.getTitle() != todoToDelete.getTitle() // true for anything except todoToDelete
        }
    }
    public static func getDeck(name:String) -> Deck? {
        for deck in allDecks {
            if deck.name == name {
                return deck
            }
        }
        return nil
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
    func setContent(content: String) {
        self.content = content
    }
    public func setTitle(title:String){
        self.title = title
    }
    func setPriority(priority: Int!) {
        self.priority = priority
    }
    public func getContent()-> String{
        return self.content
    }
    public func getDeck()-> Deck{
        return self.deck
    }
    public func getPriority()-> Int{
        return self.priority
    }
    public func hasDeck () -> Bool {
        deck != nil
    }
    public static func deleteTodo(todo: Todo){
        if todo.hasDeck() {
            todo.deck.deleteTodo(todoToDelete: todo)
        }
        allTodos = allTodos.filter() {
            $0.title != todo.title // true for anything except todo to delete
        }
    }
    public static func getTodo(title:String) -> Todo? {
        for todo in allTodos {
            if todo.title == title {
                return todo
            }
        }
        return nil
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
// if exists return false else true
func titleCheck(title:String)->Bool{
    for item in Todo.allTodos{
        if item.getTitle() == title {
            return false
        }
    }
    return true
}
// if exists return false else true
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
func showTodo() {
    print("todo title: ", terminator: "")
    let todoTitle: String! = readLine()!.trim()
    if titleCheck(title: todoTitle) { // if doesnt exist do error
        print("****wrong input: todo doesnt exist****")
        return
    }
    let todo: Todo! = Todo.getTodo(title: todoTitle)!

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"

    print(
            "Todo title: \(todo.getTitle())",
            "date created: \(dateFormatter.string(from: todo.getDate()))",
            "priority: \(todo.getPriority())",
            "deck name: \(todo.hasDeck() ? todo.getDeck().getName():"-no deck set-")",
            "content: \(todo.getContent())",
            "   1. edit todo",
            "   2. remove todo",
            "   3. back"
            , separator: "\n"
    )
    var opt: String! = readLine()!.trim()
    if opt == "1" {
        print(
                "   field to edit? ",
                "      1. title",
                "      2. priority",
                "      3. content",
                "      4. deck",
                "      5. back"
                , separator: "\n"
        )
        opt = readLine()!.trim()

        if opt == "1" {
            print("new title: ", terminator:"")
            let newTitle = readLine()!.trim()
            if !titleCheck(title: newTitle) { // if already exists do error
                print("****wrong input: todo already exists****")
                return
            }
            todo.setTitle(title: newTitle)
        } else if opt == "2" {
            print("new priority: ", terminator:"")
            let newPriority = readLine()!.trim()
            if !newPriority.isInt {
                print("****wrong input: priority must be a number****")
                return
            }
            todo.setPriority(priority: Int(newPriority))
        } else if opt == "3" {
            print("new content: ", terminator:"")
            let newContent = readLine()!.trim()
            todo.setContent(content: newContent)
        } else if opt == "4" {
            print("new deck's name: ", terminator:"")
            let newDeckName = readLine()!.trim()
            if nameCheck(name: newDeckName) { // if doesnt exist do error
                print("****wrong input: deck doesnt exists****")
                return
            }
            let deck = Deck.getDeck(name: newDeckName)!
            todo.setDeck(deck: deck)
            deck.addTodo(todo: todo)
        } else if opt == "5" {
            return
        } else {
            print("****wrong input****")
            return
        }
        print("****successful: todo edited****")
    } else if opt == "2" {
        Todo.deleteTodo(todo: todo)
        print("****successful: todo deleted****")
    } else if opt == "3" {
        return
    } else {
        print("****wrong input****")
    }
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
public func showDeck () {
    print("deck name: ", terminator: "")
    let deckName: String! = readLine()!.trim()
    if nameCheck(name: deckName) { // if doesnt exist do error
        print("****wrong input: deck doesnt exist****")
        return
    }
    let deck: Deck! = Deck.getDeck(name: deckName)!

    print(
            "Deck name: \(deck.getName())",
            "Number of todos: \(deck.getTodos().count) \n",
            "   1. add todo to this deck",
            "   2. back"
            , separator: "\n"
    )
    let opt: String! = readLine()!.trim()
    if opt == "1" {
        addTodoToDeck(deck: deck)
    } else if opt == "2" {
        return
    } else {
        print("****wrong input****")
    }
}
public func addTodoToDeck (deck: Deck) {
    print("todo title: ", terminator: "")
    let title: String! = readLine()!.trim()
    if !titleCheck(title: title) { // if exists do error
        print("****wrong input: name already exists****")
        return
    }
    print("todo content: ", terminator: "")
    let content: String! = readLine()!.trim()
    print("todo priority: ", terminator: "")
    let priorityStr: String! = readLine()!.trim()
    if !priorityStr.isInt {
        print("****wrong input: priority must be a number****")
        return
    }
    let priority = Int(priorityStr)!
    let todo = Todo(title: title,content:content, date:Date(),priority:priority)
    todo.setDeck(deck: deck)
    deck.addTodo(todo: todo)
    print("****successful: todo added to deck****")
}
public func sort(array:Array<Todo>,type:String,order:String) -> Array<Todo> {
    // to sort array
    // type can be : date,title,priority
    // order is assce or desce
    return []
}
startMenu()
