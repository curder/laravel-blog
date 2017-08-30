@extends('home.layouts.app')
@section('page_title',$post->title)

@section('content')
    <article class="container m-t-50 article">
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

            <section class="content m-t-50 m-r-20 m-b-20 m-l-20">
                {!! EndaEditor::MarkDecode($post->body) !!}
                <hr>

                <div class="description">
                    <a href="#">{{ $post->categoryId->name }}</a>
                    <small>{{ $post->created_at }}</small>
                </div>

                <div class="p-t-20 p-b-20">
                    <nav class="pagination" role="navigation" aria-label="pagination">
                        @if($post->prev())
                            <a href="{{  $post->prev()->url() }}" class="pagination-previous"><span aria-hidden="true">&larr;</span>
                                上一篇</a>
                        @else
                            <a class="pagination-previous" title="This is the first page" disabled>没有了</a>
                        @endif
                        @if($post->next())
                            <a href="{{ $post->next()->url() }}" class="pagination-next">下一篇 <span aria-hidden="true">&rarr;</span></a>
                        @else
                            <a class="pagination-next" disabled>没有了</a>
                        @endif
                    </nav>
                </div>
            </section>
        </div>
    </article>
@endsection
