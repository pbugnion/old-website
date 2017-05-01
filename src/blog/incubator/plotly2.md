
To understand your data, you have to plot it. 

Plotting underlies every stage of a data science project. During data exploration, it lets y
The lack of plotting capabilities in Scala has therefore long been a source of astonishment to me. Of course, the reason is that writing a plotting library is extremely difficult. Matplotlib, to-date, has XX commits and XX contributors, corresponding to years of toil by very experienced Python programmers. A plotting library needs to interact with the graphical layer of the underlying operating system. This makes writing a library that is portable across platforms challenging. Maplotlib has XX different backends to achieve this. The difficulty of dealing with the multitude of operating systems can be alleviated by rendering plots in a browser, rather than a native application: this is done effectively by Bokeh, for instance. Your troubles are not over, however, as you now need to inter-operate with JavaScript.

As always, there's also a people problem: the people who really need a plotting library are rarely capable of building it. Spending your days analysing data does not really teach you how to interact with GTK. And that's just the technical requirements. Building a plotting library without a strong artistic intuition backed by an understanding of data visualization principles won't end well (cf. JFreeChart). 

By offering plotting as a service, Plotly splits the enormous task of building a plotting library into two parts: the *client* has to generate a JSON representation of what we want in the graph, and the *server*, that is, Plotly itself, has the enormously more complex task of translating this JSON representation into a graph that is rendered on your browser. Thus, writing a client is as simple as being able to translate from plotting abstractions to JSON:

example of scala

then json

then graph

This is tremendously appealing to library authors. I would never have had the technical skills, time and perseverance to build a graphing library from the ground up. Generating JSON, on the other hand, is well within my reach.

I am very excited about the Scala Plotly client. A strong graphing library will help make Scala the `de facto` language for data science. Of course, Scala will get superseded by a new, more exciting language, and it will be equally easy to build a Plotly client for the new contender.

