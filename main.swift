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
        todos.removeAll(where: { $0 == todoToDelete })
    }
    public static func getDeck(name:String) -> Deck? {
        for deck in allDecks {
            if deck.name == name {
                return deck
            }
        }
        return nil
    }
    public static func == (lhs: Deck, rhs: Deck) -> Bool{
        return lhs.name == rhs.name
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
        return deck != nil
    }
    public func deleteTodo(){
        if hasDeck() {
            deck.deleteTodo(todoToDelete: self)
        }
        Todo.allTodos.removeAll(where: { $0 == self })
    }
    func editField(newVal: String, fieldToEdit: String) -> (Bool, Int) {
        switch fieldToEdit {
        case "title":
            if !titleCheck(title: newVal) { // if already exists do error
                return (false, 1)
            } else {
                title = newVal
            }
        case "priority":
            if !newVal.isInt {
                return (false, 2)
            } else {
                priority = Int(newVal)
            }
        case "content":
            content = newVal
        case "deck":
            if nameCheck(name: newVal) { // if doesnt exist do error
                return (false, 3)
            } else {
                deck = Deck.getDeck(name: newVal)
                deck.addTodo(todo: self)
            }
        default:
            print("****Unexpected field****")
            return (false, 4)
        }
        return (true, 0)
    }
    public static func getTodo(title:String) -> Todo? {
        for todo in allTodos {
            if todo.title == title {
                return todo
            }
        }
        return nil
    }
    public static func == (lhs: Todo, rhs: Todo) -> Bool{
        return lhs.title == rhs.title
    }
    public static func sorting(type:String,order:String)-> [Todo]  {
        if type=="1" {
            if order=="2"{
                return Todo.allTodos.sorted(by: { $0.date > $1.date })
            }else{
                return Todo.allTodos.sorted(by: { $0.date < $1.date })
            }
        }else if type=="2" {
            if order=="2"{
                return Todo.allTodos.sorted(by: { $0.title > $1.title })
            }else{
                return Todo.allTodos.sorted(by: { $0.title < $1.title })
            }
        }else if type == "3" {
           if order=="2"{
                return Todo.allTodos.sorted(by: { $0.priority > $1.priority })
            }else{
                return Todo.allTodos.sorted(by: { $0.priority < $1.priority })
            }
        }
        return [Todo]();
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
            "3.back")
        let input:String! = readLine()
        if input.trim()=="3"{
            return
        }else if input.trim() == "1"{
            addTodo()
        }else if input.trim() == "2"{
            showAllTodos()
        }
        else {
            print("****wrong input****")
        }
    }

}
func addTodo(){
    print("please enter title: ",terminator:"")
    let title:String! = readLine()
    print("please enter content: ",terminator:"")
    let content:String! = readLine()
    print("please enter preiority as a integer: ",terminator:"")
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
    for todo in Todo.allTodos {
        print("Title: \(todo.getTitle()) Priority: \(todo.getPriority())")
    }
    while(true){
            print("All Todos, please choose a number:\n" +
                "1.sort todo list\n" +
                "2.show todo\n" +
                "3.back")
            let input:String! = readLine()
            if input.trim()=="3"{
                return
            }else if input.trim() == "1" {
                sortMenu()
            }else if input.trim() == "2"{
                showTodo()
            }else {
                print("****wrong input****")
            }
        }
}
func sortMenu(){
    while(true){
            print("sort with:\n" +
                "1.create time\n" +
                "2.alphabetical\n" +
                "3.priority\n" +
                "4.back")
            let input:String! = readLine()
            if input.trim()=="4"{
                return
            }else if input.trim() == "1" || input.trim() == "2" || input.trim() == "3" {
                print("order:\n" +
                "1.ascenⅾing\n" +
                "2.descending")
            let input2:String! = readLine()
            if input2.trim() == "1" || input2.trim() == "2"{
                sortAndShow(typeSort: input,orderSort: input2)
                }else {
                    print("****wrong input****")
                }
            }else {
                print("****wrong input****")
            }
        }
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
        if !opt.isInt || Int(opt)! < 1 || Int(opt)! > 5 {
            print("****wrong input****")
            return
        } else if opt == "5" {
            return
        } else {
            var todoFields = ["title", "priority", "content", "deck"]
            print("new \(todoFields[Int(opt)! - 1]): ", terminator: "")
            let newVal: String! = readLine()!.trim()
            let res = todo.editField(
                    newVal: newVal,
                    fieldToEdit: todoFields[Int(opt)! - 1]
            )
            if (res.0 == true) {
                print("****successful: todo edited****")
            } else {
                switch res.1 {
                case 1:
                    print("****wrong input: todo already exists****")
                case 2:
                    print("****wrong input: priority must be a number****")
                case 3:
                    print("****wrong input: deck doesnt exists****")
                default:
                    print("****Unexpected error code****")
                }
            }
        }
    } else if opt == "2" {
        todo.deleteTodo()
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
    print("please enter name: ",terminator:"")
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
    if Deck.allDecks.isEmpty {
        print("-no decks made yet-")
    }
    for deck in Deck.allDecks {
            print("Name: \(deck.getName())")
        }
    while(true){
        print("All Decks, please choose a number:\n" +
            "1.show deck\n" +
            "2.back\n")
        let input:String! = readLine()
        if input.trim()=="2"{
            return
        }else if input.trim()=="1"{
            showDeck()
        }else{
            print("****wrong input****")
        }
    }
}

public func showDeck () {
    print("deck name: ", terminator: "")
    let deckName: String! = readLine()!.trim()
    if nameCheck(name: deckName) { // if doesnt exist do error
        print("****wrong input: deck doesnt exist****")
        return
    }
    let deck: Deck! = Deck.getDeck(name: deckName)!

    print("Deck name: \(deck.getName())",
            "Number of todos: \(deck.getTodos().count)",
            "\(deck.getTodos().isEmpty ? "" : "List of todos:")",
            separator: "\n")
    for (i, todo) in deck.getTodos().enumerated() {
        print("  \(i+1)- \(todo.getTitle())")
    }
    print("   1. move todo to this deck",
            "   2. back"
            , separator: "\n")
    let opt: String! = readLine()!.trim()
    if opt == "1" {
        moveTodoToDeck(deck: deck)
    } else if opt == "2" {
        return
    } else {
        print("****wrong input****")
    }
}
public func moveTodoToDeck (deck: Deck) {
    print("todo title: ", terminator: "")
    let title: String! = readLine()!.trim()
    if titleCheck(title: title) { // if doesnt exist do error
        print("****wrong input: todo doesnt exists****")
        return
    }
    let todo = Todo.getTodo(title: title)!
    todo.setDeck(deck: deck)
    deck.addTodo(todo: todo)
    print("****successful: todo moved to deck****")
}
public func sortAndShow(typeSort:String,orderSort:String)  {
    let sorted=Todo.sorting(type:typeSort,order:orderSort);
    for todo in sorted {
        print("Title: \(todo.getTitle()) Priority: \(todo.getPriority())")
    }
}
startMenu()
