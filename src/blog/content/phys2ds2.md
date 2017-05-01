Title: From academia to data science &mdash; part 2
Date: 2016-01-28

This is the second half of a two-part series on negotiating the transition from a PhD in a quantitative subject to data science. In the [first part](/blog/from-academia-to-data-science.html), I talked about acquiring the basic coding and algorithms skills that companies are interested in. It's now time to talk about databases, machine learning, and soft skills.

## Databases

If you're at all like me, you will likely come out of academia having never really used a database. And yet, databases are ubiquitous in industry, for good reason. If you have more data than can comfortably fit in memory, databases allow you to access and query subsets of that data easily.

Until about seven years ago, databases meant SQL. With the rise of big data, new types of databases, grouped under the misleading umbrella term NoSQL, have emerged. NoSQL databases are very fashionable at the moment, but I suggest you concentrate on learning SQL. It is a crucial part of most technology stacks, and is likely to remain so in the future. It also makes for great interview questions. Finally, transitioning from a SQL to a NoSQL database is quite easy (apart from maybe graph databases).

You should at least be able to compose basic SQL queries: understand how to join two tables together, filter rows and perform aggregation. If you have some intuition for database architecture, that's even better.

If you want to practice entering some data in a SQL database and querying it, there is quite an interesting dataset [here](http://data.scala4datascience.com/fec/us.csv.gz). It's a CSV of all donations above $200 to US presidential candidates for the 2012 cycle. The data originally comes from the [FEC website](http://www.fec.gov/disclosurep/PDownload.do). The data set is small enough that it will comfortably fit in a database on a single machine, but not comfortably in memory, hence the need for a database. Once you have all the data in a database, calculate the total donations for each candidate.

For NoSQL, it's probably enough to understand the *modus vivendi* for NoSQL databases: SQL's emphasis on normalisation makes horizontal scalability challenging. Most NoSQL databases (graph databases aside) were designed with horizontal scalability in mind.

<img src="/blog/images/data_science3.png" width="100%" />

## Machine learning

Depending on what you worked on in academia, you may have had some exposure to machine learning. If you haven't, make sure you understand the basics of statistical learning: know the difference between *supervised* and *unsupervised learning*, as well as between *classification* and *regression*.

You should make sure you are familiar with basic supervised learning algorithms: understand at least how logistic regression, decision trees and random forest algorithms work. If you know about SVMs or other tree-based methods, even better.

To show that you can do more than just blindly apply algorithms as a black box, make sure you understand common errors associated with machine learning. Understand what over-fitting is, and how to mitigate it. Know how to use cross-validation to find the optimal hyper-parameters for your algorithm. Understand quality metrics such as ROC curves and precision-recall curves.
You should also learn about feature transformation and feature building. If you're familiar with how PCA can help you deal with correlations between features, that will also help.

Andrew Ng's machine learning course on Coursera is a really good way to get started. If you work through the first few weeks of the course, you will be in a good position to transition to data science.

Ultimately, the best way to practice machine learning is to try your hand at solving machine learning problems. If you are just getting started, I recommend playing around with the toy datasets in [scikit-learn](http://scikit-learn.org/stable/datasets/). Beyond that, there are many publicly available data sets. See this [list](https://archive.ics.uci.edu/ml/datasets.html) for datasets curated specially for machine learning.
[Kaggle](https://www.kaggle.com/competitions) competitions also give you pre-cleaned data that is just begging to be analyzed.

One last warning applies here: it can be easy to focus too much on machine learning, at the expense of other skills (programming and so forth). Remember that machine learning is but one part of the data science pipeline. If you can't demonstrate the programming skills necessary to load and clean your data, it won't matter how good your machine learning knowledge is.

## Soft skills

Soft skills are important, both in academia and industry. Unfortunately, they are hard to train *in vacuo*. The easiest way to train your soft skills is through a science to data science conversion course. I expect all conversion programs put a lot of emphasis on presentation skills, interview technique, how to cope with the pressure of a different environment and how to work in a team. If anything, most of the courses involve some form of project or internship that gives you exposure to the "real world".

When you start work, navigating the new environment can be tricky. Lots of people have written lots of useful advice on how to deal with a new environment, and, unsurprisingly, it seems to mostly boil down to "be proactive, communicate as much as possible and don't be an asshole". I recommend Dale Carnegie's [How to win friends and influence people](http://www.amazon.com/How-Win-Friends-Influence-People/dp/0671027034). The writing style feels somewhat dated, but I think the advice is sound.

One thing you can train by yourself is writing. Academia does teach writing: it's likely that, by the end of your PhD, you've written well over a hundred thousand words. Unfortunately, the writing style practiced in academia doesn't necessarily transfer well. [These](https://jakevdp.github.io) [data](http://blog.echen.me) [science](http://www.johnmyleswhite.com) [blogs](http://miningthesocialweb.com) do a fantastic job of combining scientific rigour with an engaging, readable prose.
You could even start a blog about your transition into data science: it will help you remember what you've learnt and will greatly improve your writing.

<img src="/blog/images/data_science4.jpg" width="100%" />

## Network

Given the exodus of quantitative PhDs from academia to data science, I expect you have friends and former colleagues who now work as data scientists or data engineers. Leverage this network. Leaving academia can be daunting, and having feedback about life outside of academia from people you trust will help you make the right decision. It is likely that your former colleagues will have been in contact with recruitment agencies and have a clear idea of the recruitment landscape in your area.

If you're taking your first steps on the road from academia to data science, I wish you well. I hope you enjoy the transition as much as I have.

[&#8606; Previous post](/blog/from-academia-to-data-science.html)
