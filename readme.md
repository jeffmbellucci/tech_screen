## Instructions

### Short Answer
Answer with something like 1–4 sentences. We aren't looking for a precise technical definition. Answer in a way that you think is relevant to your software engineering work. If you don't know an answer, don't copy/paste from the web - just give whatever info you know.

- **What is HTML?**<br>
HTML stands for Hyper Text Markup Language and creates the primary structure of any webpage and the Dom.  HTML uses opening and closing tags (ie. "p", "div", "span", etc.) to delinate where different page elements begin and end.  Each tag has some inherent properties, but in modern web pages the most common tag is a "div".  Tags can also be nested to create any layout, limited only by imagination.
- **What is CSS?**<br>
CSS stands for Cascading Sheet Style and gives instructions for how each element on a page should look via the use of id's or classes assigned to HTML elements.  There are an incredible number of CSS properties that you can use to make a page look how you want, for example fonts, font-sizing, coloring of anything, shadows, layering via z-index, borders,  intructions for how elements should react to different screen-sizes, widths, heights, opacity, and on and on.  I were to try to describe all the available CSS properties here, it would end up being a book...
- **What is the DOM?**<br>
DOM stands for Document Object Model and is essential the base data structure of a web-page.  It would be best described as a tree data structure where each HTML element makes up an individual node on that tree.
- **What is TCP/IP?**<br>
TCP/IP stands for Transmission Control Protocol/Internet Protocol and is the primary data transfer protocol that allows the modern internet to function.
- **What is memory?**<br>
Memory most frequently refers to RAM (random access memory), which is a type of volatile data storage that can hold data for as long as it is powered.  The benefit of using RAM over something like hard disk storage is that it is extremely fast to address, read and write to, far faster than any kind of hard storage.  All software programs use RAM and hard storage for execution.  The downside of RAM is that the moment a computer is turned off, everything in memory is lost, so it does not make a good form of longterm storage.  However, it is perfect for use during software execution.
- **In a programming language, what is a class?**<br>
Classes exist in object-oriented programming languages, and they define the functionality and scope of objects.  Classes inherit for other classes to help keep codebases as D.R.Y. as possible. Classes can be intialized as many times as needed. Each is called an "instance" and can be passed data stored in instance varables, and that data can be read and manipulated during execution.  Classes also typically have instance and class methods.  Instance methods are called on instances to perform some functionality defined in the class.  Class methods are for functionality that is defined on the entire class itself.  There are also more advanced forms of classes, known as Singleton or Eigenclasses, but that is probably beyond the scope of the question.
- **In a database, what is a foreign key?**<br>
Foreign keys are the fundamental concept that allow relational/SQL databases to have relationships between tables.  It is probably easiest to describe with an example.  Let's say there is a Users and Posts table, and we want Users to have access to as many Posts as they want to create. Both the User and Posts table would have an "id" column to give each row a unique identifier.  Additionally, the Posts table would have a "user_id" column which would serve as the foreign key storing the unique "id" of the user that created that post.  In Rails, the User model would ```have_many: posts```, and the Posts model would ```belong_to: user```, allowing the User to easily access any post they created in the application. By simple calling ```User.find(:id).posts``` Rails returns all posts created by the user represented by the `:id`.
- **What is Model View Controller?**<br>
Model View Controller or MVC is the design pattern utilized by Rails and describes the flow of data within the application.  Models are classes that contain fields (ie. Users with name and address) and contain logic related to what users can do in the application.  Views contain data presentation logic and are what the user actually sees on their screen and are selected by a controller based on the routing configuration.  The views can render HTML directly, or if the controller is for an API, the controller may render JSON instead of a view, to be parsed and displayed by the front-end, usually asynchronously.  

The Controller contains all the logic for each action requested by the user.  Rails controllers default to RESTful routing that uses 7 fundamental actions (index, new, create, edit, update, show destroy), which allow the user to perform the most important actions of web applications.  Sometimes it is useful to create custom Controller actions and routes, but much of the time you can get away with just those 7 defaults. Any instance variables created in a Rails controller, perhaps by accessing model data, are automatically passed into the view.
 
### Coding
For these challenges, you may write any code you wish in order to implement your answer. Please provide code in a runable file, with some instructions in comments at the top for how to run it.

### Prime Number Finder
Write a function that looks for prime numbers for a certain amount of time. When that amount of time has elapsed, it prints the largest prime number it found, and then returns nil. invoked like this to run for 5 seconds: find_prime_number(5)

### Class design
Create classes Cat, Dog, Chicken, CatFood, DogFood, HumanFood, Lemons

- a cat likes CatFood, Chicken, and Milk
- a dog likes DogFood, CatFood, Chicken, HumanFood
- a Cat can meow and a Dog can bark (print "meow" or "bark" to STDOUT)
- when an animal eats food it likes, it makes a noise three times
- when an animal eats food it dislikes, it makes a noise one time
- You can implement this any way you like, with whatever api you think makes sense.


### Include a driver file which requires the files, instantiates the classes, and invokes the methods to demonstrate the functionality.
- How to run:
  - unzip file, open terminal, `cd` into the `health_tech_screen` directory
  - If ruby is installed on the machine, just type `ruby main.rb` and everything will execute

### Details:
#### Animal and food classes:
- I created parent `Animal` and `Food` classes that each animal and food class inherits from.
- Animals take an options hash to override default values.
- I noticed that neither the cat nor the dog like lemons, so I throw and catch an error when you feed them one.
- I also created a `Raccoon` class to show how easily extensible the animal class is. They only like HumanFood, as is true for all trash pandas. Also, raccoons have no dislikes because of course they don't. However, they also don't know what lemons are.
- Upon execution, all of the foods are tried by all of the animals, printing what each is trying and how many noises they make, as well as an error message when you feed anything a lemon.

#### Prime Number finder:
- The prime number finder uses two methods for finding primes, one uses the built in Ruby 'prime' library and the other is just brute force
- I included as many little optimizations as I could think of (ie. the fact that all primes after 2 and 3 are in the form of 6n+1 or 6n-1, only need to check the first 1/3 of factors instead of all factors 1 up to n, etc.)
- The fast approach appears to run in O(n) time, while I know the brute force approach is O(n^2), which interestingly becomes more obvious the longer you set it to run.
- I execute it twice, once for 5 seconds as the instructions say, and then once for 5 milliseconds which I pass an option to print all the primes it finds, so that you can see that it works correctly, I chose 5ms for printing the outputs in order to avoid blowing up the terminal with tens of thousands of primes, but feel free to run it for as long as you want.  The initializer takes runtime in seconds (or decimal fractions of a second).
 

### Database and model design with queries
We want to model providers (e.g. dietitians), their clients, and journal entries.

- Both providers and clients have a name and an email address.
- Providers have many clients
- Clients usually have one Provider but can have more than one.
- Clients have a plan that they paid for, signified by the string "basic" or "premium". For each provider that a client is signed up with, they have 1 plan.
- Clients post journal entries. These consist of freeform text.

### Model and relationship design
#### Model Schema:
- Providers ```name: string, email_address: string, id: integer```
- Clients ```name: string, email_address: string, id: integer```
- Plans ```provider_id: integer, client_id: integer, tier: string``` `basic` or `premium`
- JournalEntries ```content: text, client_id: integer```

- Note: `uuid` is also an option instead of integer ids, and an `enum` could be used in place of a `string` for plan `tier`

#### Relationships:
- The following code will establish all the necessary relationships, and the above schema will makes queries possible.

```Ruby 
class Clients < ApplicationRecord
  has_many :providers, through: plans
  has_many :journal_entries
end

class Providers < ApplicationRecord
  has_many :clients, through: plans
end

class Plans < ApplicationRecord
  belongs_to: clients
  belongs_to: providers
end

class JournalEntries < ApplicationRecord
  belongs_to: clients
end
```

#### We want to be able to do these queries:
- Find all clients for a particular provider: 
```Ruby 
@clients = Provider.find(:id).clients
```
- Find all providers for a particular client: 
```Ruby 
@providers = Client.find(:id).clients
```
- Find all of a particular client's journal entries, sorted by date posted:
```Ruby 
@entries = Client.find(:id).journal_entries.order(created_at: :desc) # recent first, ':asc' for oldest first
```
- Find all of the journal entries of all of the clients of a particular provider, sorted by date posted:
```Ruby 
@entries = Provider.find(:id).clients.includes(:journal_entries).order(created_at: :desc) # recent first, ':asc' for oldest first
```


