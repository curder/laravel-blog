@extends('home.layouts.app')
@section('page_title','Search')
@section('search')@stop
@section('content')
    <div class="container">
        <ais-index app-id="{{ config('scout.algolia.id') }}"
                   api-key="{{ env('ALGOLIA_SEARCH') }}"
                   index-name="posts">

            <div class="columns">
                <div class="column is-6 is-offset-3 is-10-mobile is-offset-1-mobile m-t-50 p-b-30">
                    <div class="field is-grouped is-grouped-centered">
                        <div class="control has-icons-left">
                            {{--<input class="input is-large" type="text" placeholder="Find by keyword">--}}
                            <ais-input placeholder="Search posts..." autocomplete="true" value="{{ $keyword }}"
                                       class="input is-large"></ais-input>

                            <span class="icon is-small is-left"><i class="fa fa-search-plus"></i></span>
                        </div>
                        {{--<div class="control">--}}
                        {{--<a class="button is-info is-large">--}}
                        {{--Search--}}
                        {{--</a>--}}
                        {{--</div>--}}
                    </div>
                </div>
            </div>


            <div class="columns">
                <div class="column is-10 is-10-mobile is-offset-1-mobile is-offset-1">
                    <ais-results>
                        <template scope="{ result }">

                            <div class="box">
                                <div class="content">
                                    <p>
                                        <strong>@{{ result.title }}</strong>
                                        <br>
                                        @{{ result.meta_description }}
                                    </p>
                                </div>
                                <nav class="level is-mobile">
                                    <div class="level-left">
                                        <div class="level-item">
                                            <a :href="result.category_url"
                                               class="tag is-success">@{{ result.category_id.name }}</a>
                                            &nbsp;&nbsp;
                                            <small>@{{ result.created_at }}</small>
                                        </div>
                                    </div>
                                    <div class="level-right">
                                        <a :href="result.url">Show</a>
                                    </div>
                                </nav>
                            </div>
                        </template>
                    </ais-results>
                </div>
            </div>

        </ais-index>
    </div>
@endsection
