@extends('home.layouts.app')

@section('page_title','Links')

@section('banner')
    <div class="hero is-primary">
        <div class="hero-body">
            <div class="container">
                <div class="columns level">
                    <div class="column level-left is-11">
                        <h1 class="title">
                            <a href="{{ route('links.index') }}">Links</a>
                            @if($category->exists)
                                <small>&mdash; {{ $category->name }}</small>
                            @endif
                        </h1>
                        <h2 class="subtitle">Please keep learning, do not stop ;)</h2>
                    </div>
                    @if(Voyager::can('home.links.store'))
                        <div class="column level-right">
                            <link-add></link-add>
                        </div>
                    @endif
                </div>
            </div>
        </div>
        <!-- <div class="hero-foot">
            <div class="container">
                <nav class="tabs is-boxed">
                    <ul>
                        <li class=""><a href="#">Most Recent</a></li>
                        <li class="is-active"><a heaf="#">Most Popular</a></li>
                    </ul>
                </nav>
            </div>
        </div> -->
    </div>
@endsection
@section('content')
    <nav class="navbar has-shadow">
        <div class="container">
            <div class="navbar-brand">
                <a class="navbar-item is-tab{{ request()->exists('popular') ? '' : ' is-active' }}"
                   href="{{ request()->url() }}">Most
                    Recent</a>
                <a class="navbar-item is-tab{{ request()->exists('popular') ? ' is-active':'' }}" href="?popular=1">Most
                    Popular</a>
            </div>
        </div>
    </nav>


    @include('home.links._list')
    {{--@include('home.links._add_link')--}}
@endsection
