@extends('home.layouts.app')
@section('page_title','Links')
@section('content')
    <div class="@if(auth()->check()) col-md-8 @else col-md-12 @endif">
        <h3>
            <a href="{{ route('links.index') }}">Links</a>

            @if($category->exists)
                <span>&mdash; {{ $category->name }}</span>
            @endif
        </h3>

        <ul class="nav nav-tabs">
            <li class="{{ request()->exists('popular') ? '' : 'active' }}"><a href="{{ request()->url() }}">Most
                    Recent</a></li>
            <li class="{{ request()->exists('popular') ? 'active' : '' }}"><a href="?popular=1">Most Popular</a></li>
        </ul>

        @include('home.links._list')
    </div>
    @include('home.links._add_link')
@endsection
