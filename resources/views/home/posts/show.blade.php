@extends('home.layouts.app')
@section('page_title',$post->title)

@section('content')
    <div class="container m-t-50">

        <div class="card">
            <div class="card-image">
                <figure class="image">
                    <img src="{{ $post->cover() }}" alt="{{ $post->title }}">
                </figure>
            </div>
            {{--<div class="card-content">
                <div class="media">
                    <div class="media-left">
                        <figure class="image is-48x48">
                            <img src="http://bulma.io/images/placeholders/96x96.png" alt="Image">
                        </figure>
                    </div>
                    <div class="media-content">
                        <p class="title is-4">John Smith</p>
                        <p class="subtitle is-6">@johnsmith</p>
                    </div>
                </div>--}}

                <div class="content m-t-50 m-r-20 m-b-20 m-l-20">
                    {!! EndaEditor::MarkDecode($post->body) !!} <a>@bulmaio</a>.
                    <a>#css</a> <a>#responsive</a>
                    <br>
                    <small>11:09 PM - 1 Jan 2016</small>
                </div>
            </div>
        </div>

    </div>
    <div class="col-md-10 col-sm-offset-1">
        <div class="panel panel-default">
            <div class="panel-body">
                <article class="article">
                    <header>
                        <h1>{{ $post->name }}</h1>
                        <dl class="dl-inline">
                            <dt><i class="glyphicon glyphicon-time"></i></dt>
                            <dd>{{ $post->created_at }}&nbsp;&nbsp;</dd>
                            <dd><a href="{{ route('posts.category' , $post->categoryId) }}"
                                   class="label label-success">{{ $post->categoryId->name }}</a></dd>
                            <dd class="pull-right">
                                <span class="label label-info">
                                    <i class="glyphicon glyphicon-eye-open"></i> {{ $post->views }}
                                </span>
                            </dd>
                        </dl>
                        <section class="abstract">
                            <p><strong>摘要：</strong>{{ $post->description }}</p>
                        </section>
                    </header>
                    <section class="content">
                        {!! EndaEditor::MarkDecode($post->body) !!}
                    </section>
                    <nav>
                        <ul class="pager pager-justify">
                            @if($post->prev())
                                <li class="previous">
                                    <a href="{{  $post->prev()->url() }}"><span
                                                aria-hidden="true">&larr;</span>
                                        上一篇</a>
                                </li>
                            @endif
                            @if($post->next())
                                <li class="next">
                                    <a href="{{ $post->next()->url() }}">下一篇 <span
                                                aria-hidden="true">&rarr;</span></a>
                                </li>
                            @else
                                <li class="next disabled">
                                    <a href="#">没有下一篇</a>
                                </li>
                            @endif
                        </ul>
                    </nav>
                </article>
            </div>
        </div>
    </div>
@endsection
