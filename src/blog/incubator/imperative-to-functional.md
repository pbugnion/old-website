Title: Adapting imperative idioms to functional languages
Date: 2017-04-17

Switching from coding imperatively to functionally is difficult. You feel
stunted: something that should be easy becomes inordinately difficult. This is
in part because, after you have spent a while coding imperatively, you develop
an armoury of idioms for solving common problems. Translating these idioms to a
functional language is far from obvious, since many of them rely on mutating
state. Most introductions to functional programming books don't help either: you
get a couple of `map` and `filter` examples, but that's not enough for building
anything more complex than toy programs.

This post attempts to translate common imperative idioms into higher
order functions acting over collections. We'll skip over the most basic idioms,
like those that just use `map` and `filter`, since those are pretty well covered
elsewhere.

I'll use Python for the imperative examples and Scala for the functional examples
but this is really about idioms, not the underlying implementation.

## Mutating state at every iteration

Often, we want to iterate over elements of a list and mutate a counter or a
single result. For instance, to find the two largest elements of a list:

```python
it = [8, 4, 5, 9, 21]

def find_two_largest(it):
    assert len(it) >= 2
    two_largest = sorted((it[0], it[1])) # current value of the two largest elements

    for elem in it[2:]:
        second_largest, largest = two_largest
        if elem > largest:
            two_largest = (largest, elem)
        elif elem > second_largest:
            two_largest = (elem, largest)

    return two_largest
```

For every iteration of the loop, we are mutating the variable `two_largest` that
lives outside of the loop body. We do this because we need to pass state between
iterations. To make this functional and avoid mutating state, we can use `fold`:

```scala
val it = Seq(8, 4, 5, 9, 21)

def findTwoLargest(it: Seq[Int]): (Int, Int) = {
  require(it.size >= 2)
  val startState = if (it(0) < it(1)) (it(0), it(1)) else (it(1), it(0))
  
  it.drop(2).fold(startState) { (twoLargest, elem) =>
    val (secondLargest, largest) = twoLargest
    if (elem > largest) { (largest, elem) }
    else if (elem > secondLargest) { (elem, largest) }
    else { (secondLargest, largest) }
  }
}
```

With `fold`, we replace the global mutable state with an accumulator that is
passed from one iteration to the next. In this case, our accumulator is just our
current guess at the two largest elements. This accumulator is immutable: we
compute a new value at every iteration.

For a more complex variant, let's split a sentence into words (without using
`split`). We can do this by keeping a list of the words we have seen so far and
a reference to the word we are currently building.

```python
s = "The quick brown fox jumped over the lazy dog"

words = []
current_word = ""

for letter in s:
    if letter == " ":
        words.append(current_word)
        current_word = ""
    else:
        current_word += letter
```

To use `fold`, we pass the list of complete words we have seen so far and the
current word through the accumulator:

```scala
val s = "The quick brown fox jumped over the lazy dog"

s.fold((List.empty[String], "")) { case ((words, currentWord), letter) => 
  if (letter == " ") { currentWord :: words, "") else { (words, currentWord + letter) }
}
```

To achieve the same asymptotic complexity, the functional variant relies on high performance
immutable data structures. In particular, the operation `currentWord :: words`, which returns 
a new value of the list `words` with the variable `currentWord` pre-pended, has computational 
complexity $O(1)$.

## Map until a predicate is satisfied

We often want to apply a given operation to elements in a list until some
condition is satisfied.

```python
l = []

for elem in it:
    felem = f(elem)
    if felem % 100 == 0:
        break
    else:
        l.append(felem)
```

When you want to potentially stop an iteration early, the trick is to use
iterators combined with `takeWhile`:

```scala
it.toIterator.map { elem => f(elem) }.takeWhile { _ % 100 != 0 }
```

Often, we want to evaluate the stopping criterion based on some state that
carries between iterations. In the previous section, we saw that we could use
`fold` to carry state between iterations. The problem with using fold on an
iterator is that it returns a single result, so the entire iterator is consumed
before it gets returned.

Fortunately, we can use `fold`'s less well-known cousin, `scan`, which allows us
to keep state between iterations like `fold`, but emits the current value of the
accumulator at every iteration:

```python
```

```scala
it.toIterator.map { elem => f(elem) }.scan { (felem, acc) =>
  (felem, felem + acc)
} ???
```

To conclude, switching to using higher order functions without mutating state is
challenging because many of the programming tools that we are used to do not
carry across. Learning how to translate from imperative patterns to functional
ones is an important step in achieving fluency with a functional language.

