
{%- macro add_blog_input_classes(cell) %}
{%- if cell.metadata.blog is defined %}
{%- if cell.metadata.blog.add_class is defined -%}
{{ cell.metadata.blog.add_class }}
{%- endif %}
{%- endif %}
{%- endmacro -%}
