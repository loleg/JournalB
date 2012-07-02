<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet/less" type="text/css" href="_css/style.less">

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <script src="_js/less.js" type="text/javascript"></script>
    <script src="_js/general.js" type="text/javascript"></script>

    <!-- Favicons -->
    <link rel="shortcut icon" href="_img/favicon.ico">
    <link rel="apple-touch-icon" href="_img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="_img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="_img/apple-touch-icon-114x114.png">

    {{* Page Meta-info from Newscoop *}}
	<title>{{ if $gimme->article->defined }}{{ $gimme->article->name }} | {{ elseif $gimme->section->defined }}{{ $gimme->section->name }} | {{ /if }}{{ $gimme->publication->name }}</title>
	<meta name="author" content="{{ if $gimme->article->defined }}{{ $gimme->article->author->name }} - {{ /if }}{{ $gimme->publication->name }}" >
	{{ if empty($siteinfo) }}{{ $siteinfo=['description' => '', 'keywords' => ''] }}{{ /if }}
	{{* if an article is active, meta-description of web page will be article's intro, otherwise it will pull site's description from System Preferences (/Configure/System Preferences) *}}
	<meta name="description" content="{{ if $gimme->article->defined }}{{ $gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}{{ else }}{{ $siteinfo.description }}{{ /if }}">
	{{* if an article is active, meta-keywords will be generated of article keywords (defined on article edit screen), otherwise it will use site-wide keywords from System Preferences (/Configure/System Preferences) *}}
	<meta name="keywords" content="{{ if $gimme->article->defined }}{{ $gimme->article->keywords }}{{ else }}{{$siteinfo.keywords}}{{ /if }}" />
	
	<!-- RSS & Pingback -->
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="http://{{ $gimme->publication->site }}/en/static/rss/">
	
	{{ if $gimme->article->defined }}{{* Open Graph protocol metatags for Facebook sharing *}}
	  <meta property="og:title" content="{{$gimme->article->name|html_entity_decode|regex_replace:'/&(.*?)quo;/':'&quot;'}}" />
	  <meta property="og:type" content="article" />
	  <meta property="og:url" content="http://{{ $gimme->publication->site }}{{ uri }}" />
	  <meta property="og:site_name" content="{{ $gimme->publication->name }}" />
	  <meta property="og:description" content="{{$gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}" />
	{{ list_article_images }}
	  <meta property="og:image" content="{{ $gimme->article->image->imageurl }}" />
	{{ /list_article_images }}
	{{ /if }}

</head>