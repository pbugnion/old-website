
# Pascal Bugnion's personal website

This is the source for Pascal's personal website, deployed at [pascalbugnion.net](https://pascalbugnion.net).

The website is written directly in HTML, leveraging [Bootstrap](https://getbootstrap.com/). The [blog](https://pascalbugnion.net/blog/index.html) is written in Markdown and Jupyter notebooks, statically compiled to HTML via [Pelican](https://github.com/getpelican/pelican/tree/master/pelican).

The website is deployed on Amazon S3, served behind CloudFront to provide TLS termination and HTTP to HTTPS redirection. The domain name and DNS records are stored in Route 53.
