<ul class="list-group">
    @if($links->isNotEmpty())
        @foreach($links as $link)
            <li class="links-link list-group-item">
                <form action="{{ route('votes.store', $link) }}" method="post">
                    {{csrf_field()}}
                    <button class="btn{{ Auth::check() && Auth::user()->votedFor($link) ? ' btn-success' : ' btn-default' }}" {{ auth()->guest() ? 'disabled' : '' }} >{{ $link->votes->count()}}</button>
                </form>
                <a href="{{ route('links.category',$link->categoryId ) }}" class="label label-default"
                   style="background-color: {{ $link->categoryId->color }}">
                    {{ $link->categoryId->name }}
                </a>
                <a href="{{ $link->link }}" target="_blank">{{ $link->name }}</a>
                <small>Created by <a
                            href="#">{{ $link->authorId->name }}</a> {{ $link->updated_at->diffForHumans() }}
                </small>
            </li>
        @endforeach
    @else
        <li class="list-group-item">No contribute yet.</li>
    @endif
</ul>
{{ $links->appends(request()->query())->links() }}
