@if($links->isNotEmpty())
    @foreach($links as $link)
        <div class="card links">
            <div class="container">
                <div class="card-content">
                    <form action="{{ route('votes.store', $link) }}" method="post" class="is-horizontal">
                        {{ csrf_field() }}
                        <button class="button{{ Auth::check() && Auth::user()->votedFor($link) ? ' is-success' : ' is-default' }} is-small">{{ $link->votes->count()}}</button>
                    </form>

                    <a href="{{ route('links.category',$link->categoryId ) }}" style="background-color: {{ $link->categoryId->color }}"><span class="tag">{{ $link->categoryId->name }}</span></a>

                    <a href="{{ $link->url }}" target="_blank">{{ $link->name }}</a>
                    Created {{ $link->updated_at->diffForHumans() }}
                    <p class="has-text-grey-light">some description.Please keep go to study, don't stop!Please keep go
                        to study, don't stop!Please keep go to study, don't stop!Please keep go to study, don't
                        stop!Please keep go to study, don't stop!</p>

                </div>
            </div>
        </div>
    @endforeach
@endif
{{ $links->appends(request()->query())->links() }}
