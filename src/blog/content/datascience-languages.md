Title: The right programming language for data science
Date: 2016-03-20

At [ASI Data Science](http://www.theasi.co), we run an eight week data science fellowship that takes the brightest PhDs and postdocs and trains them in data science. The fellows spend seven weeks working closely with a company as part of the fellowship. This is the story of one of the fellows, John.

John was about to embark on his project working with a company to help build a data science platform in Scala. Here's the catch: John didn't know any Scala, and, while Scala has many virtues, approachability is definitely not one of them. Not being faint-hearted, John set about learning. By carefully choosing learning material that was neither too simplistic nor too abstract, he made some progress. Nevertheless, he felt he was stuck learning the basics while the other fellows were zooming ahead, using neural networks and gradient boosted trees. Fortunately, everything worked out, John managed to pull off a great project and was able to leverage his newly acquired Scala skills to get an amazing job.

As John's story shows, the language you choose matters. This decision can strongly influence the success of the project, and yet there are several competing languages and a slew of misleading writing that just adds to the noise.

Contrary to KDNuggets latest top 5 list, the truth is that the key factors for making this decision will be internal to your team, so no blog post will provide a silver bullet. Do you have a senior employee who is a Scala expert and can drive the design and implementation of your product? Or does everyone just know Python? Are your engineers and scientists keen (and able) to learn a new technology together? The choice you make should, above all, reflect the knowledge landscape in your organisation.

But, if you work with a talented and motivated team and you have the scope to make your choice based on the merits of a language, you need to be aware of the strengths and weaknesses of the various languages used in data science. This post attempts to give an (unapologetically opinionated) overview of the different options.

## Languages in data science

There are a few languages you can choose from if you are starting a new project. The serious contenders fall in two categories:

- Dynamic languages, predominantly [Python](https://en.wikipedia.org/wiki/Python_(programming_language)) or [R](https://en.wikipedia.org/wiki/R_(programming_language))
- [Scala](https://en.wikipedia.org/wiki/Scala_(programming_language)) or [Java](https://en.wikipedia.org/wiki/Java_(programming_language)): statically typed languages that run on the Java virtual machine

There are, of course, other options. You might consider [Matlab](http://uk.mathworks.com/products/matlab/?requestedDomain=uk.mathworks.com) if you like paying for things and vendor lock-in. [Julia](https://en.wikipedia.org/wiki/Julia_(programming_language)) is definitely up-and-coming, but I don't really know enough about the language to make an informed commentary. [Go](https://en.wikipedia.org/wiki/Go_(programming_language)) occasionally comes up, but I doubt it has the libraries to be a serious contender at the moment.

## Development speed and scalability

You probably want to build a high quality product as soon as possible. Different languages allow you to develop at different speeds. Obviously, it makes sense to choose one that allows you to be as productive as possible, but what that means is not necessarily obvious. There are two dimensions (at least) in which one can measure programming language productivity:

 - The speed at which you can write the first ten lines of code, or how quickly you can get a fairly simple task done
 - The language scalability: how much harder is adding the 100,000th line, or the millionth line, compared to the first, and how well the language copes with several people contributing to the same code base.

These two considerations are often at odds. Shell scripts, for instance, makes solving some problems trivial, but nobody in their right mind would write a shell script longer than 200 lines.

Dynamic languages like Python allow you to get started very quickly and you can definitely write large applications (YouTube and Dropbox are both written in Python, for example). However, if you are planning on writing a larger application in Python, you will need to plan for this up front and adopt a programming style that is different to how you might write a simple script: you will need more object orientation and more unit testing to verify assumptions. All the additional safeguards that become necessary when the application is too large to fit in your head end up slowing down development.

Scala hits the right spot for larger applications, thanks largely to its very powerful type system that catches many programmer errors. Unlike in Java, the type system also stays out of your way, thanks to type inference. Scala is also really fun. On the downside, the greater emphasis on provable correctness does slow down initial development.

Since everyone loves graphs, this is a very opinionated graph of the scalability vs. initial development speed for those languages that are commonly used in data science:

<img width="80%"
 style="display:block;margin-left:auto;margin-right:auto;margin-top:1em;margin-bottom:1em;"
  src="images/programming-languages.svg" />

## Availability of libraries and tools

Python and R have great libraries for data exploration, preprocessing, and  machine learning. [Scikit-learn](http://scikit-learn.org/stable/) makes it absurdly easy to try out a model on a data set, while [IPython notebooks](http://jupyter.org) let you document the data exploration process. Both Python and R provide extensive plotting functionality.

Scala (and Java, to a lesser extent) has great support for concurrency, distributed computing and stream processing. The [Akka](http://akka.io) framework makes writing complex, long-running, concurrent, fault-tolerant applications manageable. On the flip-side, there is still more friction to data exploration in Scala than Python, though tools like [Spark notebooks](http://spark-notebook.io) or [Apache Zeppelin](https://zeppelin.incubator.apache.org) are helping to bridge the gap.

## Community support

If many people use a language, it is likely that, if you come across a problem or a bug, you are not the only one. Hopefully, someone has already found a fix. The main languages mentioned in this post have great community support.

## Parting words

The take-home message from this is, all other things being equal, it probably makes sense to use Python or R if you are working on a small, time-bound project. For larger endeavours, Scala can help avert the increase in complexity associated with managing a larger project.

In the excellent book [Peopleware](https://en.wikipedia.org/wiki/Peopleware:_Productive_Projects_and_Teams), Tom deMarco and Tim Lister write "*The major problems of our work are not so much technological as sociological in nature*". The premise is that the problem that you are trying to solve can probably be solved in any reasonable language. If the project fails, it is likely to be because of sociological problems: maybe your employees quit because you made them use a language they didn't want to use, or because of other organizational problems. Ultimately, which language you choose will matter far less than having the right team.
