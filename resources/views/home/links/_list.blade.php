@if($links->isNotEmpty())
    @foreach($links as $link)
        <div class="card links">
            <div class="container">
                <div class="card-content">
                    <div class="media">

                        <form action="{{ route('votes.store', $link) }}" method="post" class="is-horizontal">
                            {{ csrf_field() }}
                            <button {{ auth()->guest() ? 'disabled' : '' }} class="button{{ Auth::check() && Auth::user()->votedFor($link) ? ' is-success' : ' is-default' }} is-small">{{ $link->votes->count()}}</button>
                        </form>
                        <a href="{{ route('links.category',$link->categoryId->slug ) }}" class="m-r-10"><span
                                    class="tag is-info"
                                    style="background-color: {{ $link->categoryId->color }}">{{ $link->categoryId->name }}</span></a>

                            <a href="{{ $link->url }}" target="_blank" class="m-r-10"><strong>{{ $link->name }}</strong></a>


                        <small class="has-text-grey-light">
                            发布于{{ $link->updated_at->diffForHumans() }}
                        </small>
                    </div>
                    <div class="content has-text-grey-light">
                        <small>{{ $link->description }}</small>
                    </div>

                </div>
            </div>
        </div>
    @endforeach
@endif
{{ $links->appends(request()->query())->links() }}
