# swiftTodo

## By:
###### Yasin moosavi 98110351
###### Peyman Haji Mohammad 98170776
###### Dorrin Sotoudeh 98170851

## How it works
- the whole program is a list of menus and you select options by entering their number (keep in mind your input has to be a number and it must be in the range. otherwise, ERROR!!)
- except for the first screen, every menu has a `back` option. also the first menu has an `exit` option

## Features:
1. Create todo item: `Todo Menu > add todo > ورودی ها را به ترتیب گفته شده وارد کنید`
    -  Note 1: if you entered a title that has already been used, error will show and you are sent back to Todo Menu
    -  Note 2: if your input for priority was not a number, error will show and you are sent back to Todo Menu
2. View List of todos: `Todo Menu > show all todos`
3. Delete todo item: `Todo Menu > show all todos > show todo > تایتل تودویی که میخواهید حذف کنید وارد کنید > remove todo`
    - Note: if you enter a todo title that doesnt exist, error will show and you are sent back to All Todos Menu
4. Sort todos: `Todo Menu > show all todos > sort todo list`. choosing what to sort by and being ascending or descending is like below:
    4.1. sorting by todo's create time: ` > create time`
      4.1.1 now choose ascending and descending by selecting `ascenⅾing` or `descending` respectively
    4.2. sorting by title: ` > alphabetical`
      4.2.1 now choose ascending and descending by selecting `ascenⅾing` or `descending` respectively
    4.3. sorting by priority: ` > priority`
      4.3.1 now choose ascending and descending by selecting `ascenⅾing` or `descending` respectively
5. Create deck: `Deck Menu > add deck > ورودی ها را به ترتیب گفته شده وارد کنید`
    - Note: if you enter a deck title that already exists, error will show and you are sent back to Deck menu
6. Add a todo to a deck: `Deck Menu > show all decks > show deck > تایتل لیستی را که میخواهید به آن تودو اضافه کنید وارد کنید > move todo to this deck > تایتل تودویی که میخواهید اضافه کنید را وارد کنید`
    - Note 1: if no decks exists with that title, error will show and you are sent back to All Decks Menu 
    - Note 2: if no todos exists with that title, error will show and you are sent back to All Decks Menu
7. View List of todos in a deck: `Deck Menu > show all decks > 1.show deck > تایتل لیستی را که میخواهید تودوهای آنرا ببینید`. now you will see the deck properties including its list of todos.
8. Edit todo: `Todo Menu > show all todos > show todo > تایتل تودویی که میخواهید حذف کنید وارد کنید > edit todo`. now choose the field you want to edit and then the enter its new value.
    - Note 1: if you are editing its title and enter a new title that already exists, error will show and you are sent back to All Todos Menu
    - Note 2: if you are editing its priority and enter a new priority that isnt a number, error will show and you are sent back to All Todos Menu
    - Note 3: if you are editing its deck and enter a new deck that doesnt exist, error will show and you are sent back to All Todos Menu
