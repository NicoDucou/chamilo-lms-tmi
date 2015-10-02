<!DOCTYPE html>
<!--[if lt IE 7]> <html lang="{{ document_language }}" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>    <html lang="{{ document_language }}" class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>    <html lang="{{ document_language }}" class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--><html lang="{{ document_language }}" class="no-js"> <!--<![endif]-->
<head>
{% block head %}
{% include template ~ "/layout/head.tpl" %}
{% endblock %}
</head>
<body dir="{{ text_direction }}" class="{{ section_name }} {{ login_class }}">
<noscript>{{ "NoJavascript"|get_lang }}</noscript>

<!-- Display the Chamilo Uses Cookies Warning Validation if needed -->
{% if displayCookieUsageWarning == true %}
    <!-- If toolbar is displayed, we have to display this block bellow it -->
    {% if toolBarDisplayed == true %}
        <div class="displayUnderToolbar" >&nbsp;</div>
    {% endif %}
    <form onSubmit="$(this).toggle('slow')" action="" method="post">
        <input value=1 type="hidden" name="acceptCookies"/>
        <div class="cookieUsageValidation">
            {{ "YouAcceptCookies" | get_lang }}
            <span style="margin-left:20px;" onclick="$(this).next().toggle('slow'); $(this).toggle('slow')">
                ({{"More" | get_lang }})
            </span>
            <div style="display:none; margin:20px 0;">
                {{ "HelpCookieUsageValidation" | get_lang}}
            </div>
            <span style="margin-left:20px;" onclick="$(this).parent().parent().submit()">
                ({{"Accept" | get_lang }})
            </span>
        </div>
    </form>
{% endif %}


{% if show_header == true %}

<div class="container">
    <header>
        <div class="row">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu-bar-top">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>

                                <div class="logo-header">
                                    {{ logo }}
                                </div>

                        </div>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="menu-bar-top">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="{{ _p.web_main ~ 'auth/courses.php' }}"> {{ "AdminCourses"|get_lang }} </a></li>      
                                {% if user_notifications is not null %}
                                    <li><a class="new-messages" href="{{ message_url }}">{{ user_notifications }}</a></li>
                                {% endif %}
                                {% if _u.logged == 0 %}
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                        Iniciar Sesión<span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li class="login-menu">
                                        {# if user is not login show the login form #}
                                            {% block login_form %}

                                            {% include template ~ "/layout/login_form.tpl" %}

                                        {% endblock %}
                                        </li>
                                    </ul>
                                </li>
                                {% endif %}
                                {% if _u.logged == 1 %}
                                <li class="dropdown">

                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                        {{ _u.complete_name }}<span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu" role="menu">
                                        
                                        {% for item in list %}
                                            {% if item['key'] != 'my-space' and item['key'] != 'dashboard' and item['key'] != 'homepage' %}
                                                <li><a href="{{ item['url'] }}">{{ item['title'] }}</a></li>
                                                
                                            {% endif %}
                                        {% endfor %}
                                        {% include template ~ "/layout/menu.tpl" %}
                                        <li class="divider"></li>
                                        <li>
                                            <a title="{{ "Logout"|get_lang }}" href="{{ logout_link }}">
                                                <i class="fa fa-sign-out"></i>{{ "Logout"|get_lang }}
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                {% endif %}
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>
            </div>

            <div class="search-header">
                <form class="navbar-form" role="search" action="{{ _p.web_main ~ 'auth/courses.php' }}">
                    <div class="input-group">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                        <input type="hidden" name="action" value="search_session" >
                        <input class="form-control" placeholder="{{ "SearchCourse"|get_lang }}" name="q" type="text">
                    </div>
                </form>
            </div>
        {% if _u.is_admin == 1 %}
        {% block breadcrumb %}
        {{ breadcrumb }}
        {% endblock %}
        {% endif %}
        </header>
{{ flash_messages }}    
</div>
    <!-- Inicia el slider -->
    
    {# Announcements  #}
    {% if announcements_block %}
    <div class="slider-top">
        {{ announcements_block }}
    </div>
    {% endif %}
    <!-- fin del slider -->
<div class="container" id="page-wrap">
    <div id="top_main_content">
    <div class="row">
    {# course navigation links/shortcuts need to be activated by the admin #}
    {% include template ~ "/layout/course_navigation.tpl" %}
{% endif %}
