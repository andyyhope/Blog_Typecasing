![](https://cdn-images-1.medium.com/max/1600/1*XUa79Ukg_idcjzDkQNJ6wA.png)

# Swift: Typecasing
## Enums as data models?

Every once in a while you come across one of those unicorn edge cases that force you to challenge everything you know about everything you’ve ever learnt up until that current point in time and space. Just recently I had become a victim of such an event.

I had a chance to revisit, remodel and refactor an API response for one of the apps I work on where it would receive a JSON structure that had mixed models inside of an array. The reason why they’re mixed is because they need to be represented in a UITableView from within the same section, in a chronologial order. So this made receiving the data in two separate arrays and combining them afterwards a non-option.

Read the full article [here](https://medium.com/swift-programming/swift-typecasing-3cd156c323e#.e4kj5iojj)

--

tl;dr:
Turn these

```swift

if models.characters[indexPath.row] is Hero {
	// Do something
}

if let hero = models.characters[indexPath.row] as? Hero {
	print(hero.power)
}
```

Into this

```swift
switch model.characters[indexPath.row] {
    case .hero(let hero):
        print(hero.power)
    
    case .princess(let princess):
        print(princess.kingdom)
    
    case .civilian(let civilian):
        print(civilian.name)
}
```