Title: From academia to data science
Date: 2016-01-28

You're finishing a PhD in physics, engineering or another quantitative subject, and you're wondering what to do next. You might have heard the term "data science" bandied around your research group, so you decide to look into it. You realize that, as a data scientist, you will be solving difficult, interesting problems, much like in academia, but with the additional benefit of job stability, being part of a team, and without that gnawing feeling of guilt that you should be working all the time that seems to accompany academic careers.

The transition to data science can be daunting. If you are finishing a PhD in a quantitative subject, you have a solid mathematical and logical grounding, but there is still a lot you need to learn to be an effective data scientist. This two-part blog post provides a (very opinionated) laundry list of skills that you might want to work on, both to prepare for interviews and when you are starting your new job.

To convince you that what I'm saying is somewhat credible, here's my story. I finished a PhD in computational physics in Cambridge about 18 months ago. I then took part in a "bootcamp" to facilitate the transition from science to data science called [the ASI](http://theasi.co). I then joined what was at the time a small data science consultancy called [SCL Elections](http://scl.cc) as a data architect. As part of my job at SCL, I interviewed at least twenty data science and data engineering candidates, so I have experience on both sides of the table.

## The easy route

The easiest way to transition to data science is through a fellowship program or bootcamp. These take people with PhDs (or sometimes Masters) in quantitative subjects and, through a combination of taught material, self-study and a placement in a company, guide you through the transition to data science. After the course, they function as a recruitment agency and try to find you a job. Most of the courses are free for the student. Their business model is to charge a recruitment fee to the company that hires you.

I attended [the ASI](http://theasi.co) in London, and it was tremendously useful. The [Insight](http://insightdatascience.com) program in San Francisco and New York is also highly regarded. This [blogpost](http://yet-another-data-blog.blogspot.ch/2014/04/data-science-bootcamp-landscape-full.html) is a good list of all the bootcamps available.

If you can't, or don't want to attend a fellowship, the following will give you an idea of what you ought to know to succeed in interviews and to hit the ground running when you get started.

<img src="/blog/images/data_science.jpg" width="100%" />

## Programming

So you've done a PhD in a quantitative subject. It's likely you've at least dabbled with code. Maybe you've played around with Matlab or R to analyze your data, or, if you're really lucky, you've had to modify some Fortran 77 code your supervisor wrote back in the stone age.

There is no real incentive to code well in academia. Jake VanderPlas describes the problem perfectly in two [blog](http://jakevdp.github.io/blog/2013/10/26/big-data-brain-drain/) [posts](https://jakevdp.github.io/blog/2014/08/22/hacking-academia/), which are well-worth reading.

Coding in industry is different. If you're writing a code snippet, maybe your colleagues can benefit from using it as well. Suddenly, writing code that can be re-used by other people in your company becomes a really good use of your time (this is one of the reasons I love the real world). I can't speak for every company, but certainly at SCL, contributing to the company code base to make your colleagues more productive is very highly regarded.

## Python

You should therefore demonstrate that you can write good code, and that you care about code. Make sure you know Python. R is probably also OK, but Python is probably more versatile.

Chances are that you will have to write some code in the interview, so make sure you are sufficiently conversant in Python to understand what your interviewer is saying. You don't need to be a fellow of the PSF to get a job as a data scientist, but you should at least:

 - be familiar with more advanced features of Python: iterators, generators, list comprehensions, dictionary comprehensions, the collections module, tuple unpacking, lambda functions. If you're also familiar with context managers, decorators, coroutines, the GIL, and multiprocessing, even better.
 - be aware of libraries which are useful for data science. You should be familiar with Numpy arrays, and have a basic idea of what functionality is available in Scipy. You should know how to interact with Pandas dataframes. Again, you don't need to be [Wes McKinney](http://wesmckinney.com), but you should know how to perform basic filters and aggregation. You should also have dabbled with scikit-learn and Matplotlib.
 - be familiar with Python code convention. You should at least know what [PEP 8](https://www.python.org/dev/peps/pep-0008/) is. Remember that coding in industry is much more collaborative than in academia, so sticking to conventions is much more important. If you know what the [Zen of Python](https://www.python.org/dev/peps/pep-0020/) is, that's even better.

Learning a programming language takes time. You can't just spend a couple of days reading a tutorial and wing it. The best way to learn is to try and solve real problems. Some of the [Kaggle](https://www.kaggle.com/competitions) "getting started" competitions provide a good starting point. I recommend the [Titanic competition](https://www.kaggle.com/c/titanic). If you can get someone to review the code you've written, that's even better.

<img src="/blog/images/data_science2.png" width="100%"/>

## Coding best practice

Code is *good* when other people (or you) can modify it easily. People who are infinitely better qualified than I am have written reams on software craftmanship. If you're interested, I recommend [The Pragmatic Programmer](http://www.amazon.com/Pragmatic-Programmer-Journeyman-Master/dp/020161622X/ref=sr_1_1?s=books&ie=UTF8&qid=1451201873&sr=1-1&keywords=the+pragmatic+programmer), or [this](http://blog.codinghorror.com/a-pragmatic-quick-reference/) post by Jeff Attwood for a pithy summary. [Uncle Bob](https://en.wikipedia.org/wiki/Robert_Cecil_Martin)'s [writings](http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882) are also very highly regarded.

I will focus on one pet peeve.
I think the most egregious mistake that freshly-minted data scientists make is to write mammoth functions. If your function is more than ten lines, chances are that it's too long. A function or method should really do a single thing.

So what's so bad about writing long functions? Let's imagine you have written a program that pulls some data from the database, applies some transformation to the features, trains a random forest on a training set, extrapolates to a larger population and pushes the results back to the database; in short, a typical workflow for a data science problem. I now have to modify the code you've written. For the sake of argument, let's say that I need to specifically to change the way the *income* feature is treated. You, being, of course, a stellar Python programmer, have written your code as follows:

    :::python
    ...

    if __name__ == "__main__":
        raw_training = pull_training_from_sql()
        transformed_training = transform_features(raw_training)
        model = fit_model(transformed_training)

        ...

I can immediately see that, in all likelihood, the code I need to change is in the `transform_features` function. You might have structured this function like this:

    :::python
    def transform_features(input_df):
        output_df = pd.DataFrame()
        output_df["age"] = transform_age(input_df["age"])
        output_df["tv_user"] = transform_tv(input_df["tv_user"])
        output_df["income"] = transform_income(input_df["income"])
        ...

Again, I can immediately see that I will probably need to change the `transform_income` method. This program is well-written in the sense that it's pretty clear which part of the code does what. The complexity required to make a small change only grows weakly with code size. The code for top-level functions reads like a table of contents, and, when you dive down to the functions that actually do the work, each function does just one thing. The function name reflects what the function does.

If, by contrast, the code had been written as one big monolithic method, I would have to wade through the entire method to find where to make the relevant change. This is a pain, so please please write short methods, for the sake of the person who has to change your code.

For a slightly longer discussion of code quality, [this](http://programmers.stackexchange.com/a/61672) is a concise list of the symptoms of good and bad code.

As you grow more confident with coding, you may want to learn more about the theory underpinning programming. Read about classes and object oriented programming, read about functional programming and try to use Python's functional elements. Learn a functional language (go for Scala, not Haskell, because pragmatism beats purity).

Above all, remember that programming is a craft, not a science. It takes time and effort to hone your skills and become a good programmer. Peter Norvig's "[Teach yourself programming in ten years](http://norvig.com/21-days.html)" is a fantastic article. Read it, but, above all, practice, practice, practice.

## Algorithms, code complexity and data structures

Having an understanding of the basics of computer science is important for data scientists. You don't need to know how to implement a red-black tree but you should be able to understand why *this*:

    :::python
    important_users = { 234, 567, 1243, ... }

    for user in users:
        if user in important_users:
            # do something

... is much better than *this*:

    :::python
    important_users = [ 234, 567, 1243, ... ]

    for user in users:
        if user in important_users:
            # do something

This isn't just for the sake of interview preparation: accidentally writing an $O(n^2)$ algorithm might make the difference between a few hours of computational time and a few days of computational time when your data is big enough.

As a minimum, I suggest a basic understanding of hash tables and arrays, and how these translate to Python data structures. Some understanding of basic CS algorithms, such as sorting and search will also help. The canonical book introducing algorithms and data structures is [CLRS](https://en.wikipedia.org/wiki/Introduction_to_Algorithms), but this might well be overkill. [This](http://www.cs.cmu.edu/~guna/15-123S11/Lectures/Lecture17.pdf) seems like a good reference on hash tables, and [this](http://www.laurentluce.com/posts/python-list-implementation/) seems like a good reference on Python lists.

Don't neglect basic numerical algorithms. These make great interview questions, and they underpin all higher level machine learning algorithms. You should at least know how to do one-dimensional numerical integration, one-dimensional optimization and one-dimentional root-finding. You should also be able to solve basic probability problems with Monte Carlo methods.


In the [second](/blog/from-academia-to-data-science-part-2.html) part of this blog post, I will talk a bit more about *databases* and *machine learning*, and give advice on acquiring the right soft skills to negotiate the transition from science to data science.

[Next post &#8608;](/blog/from-academia-to-data-science-part-2.html)
