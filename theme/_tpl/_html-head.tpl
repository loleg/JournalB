<!DOCTYPE html>
<!--[if IE]>
<html class="ie" lang="de">
<!--[else]-->
<html lang="de">
<!--<![endif]--> 
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet/less" type="text/css" href="{{ url static_file='_css/style.less' }}">
    
    {{ if preg_match("/(iPhone|iPod|iPad).*AppleWebKit(?!.*Safari)/", $smarty.server.HTTP_USER_AGENT) }}
    	<link rel="stylesheet/less" type="text/css" href="{{ url static_file='_css/native-application.less' }}">
	{{ /if }}
	
	<link rel="stylesheet" type="text/css" media="print" href="{{ url static_file='_css/print.css' }}">
	
	<script src="{{ url static_file='_js/less.min.js' }}" type="text/javascript"></script>

    <!-- Favicons -->
    <link rel="shortcut icon" href="{{ url static_file='_img/favicon.ico' }}">

	<title>{{ if $gimme->article->defined }}{{ $gimme->article->name }} | {{ elseif $gimme->section->defined }}{{ $gimme->section->name }} | {{ /if }}{{ $gimme->publication->name }}</title>
	<meta name="author" content="{{ if $gimme->article->defined }}{{ $gimme->article->author->name }} - {{ /if }}{{ $gimme->publication->name }}" >
	{{ if empty($siteinfo) }}{{ $siteinfo=['description' => '', 'keywords' => ''] }}{{ /if }}
	<meta name="description" content="{{ if $gimme->article->defined }}{{ $gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}{{ else }}{{ $siteinfo.description }}{{ /if }}">
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
	
	<script type="text/javascript">var page = "";</script>

</head>