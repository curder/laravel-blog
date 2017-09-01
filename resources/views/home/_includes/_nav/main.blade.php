<nav class="navbar is-transparent">
    <div class="container">
        <div class="navbar-brand">
            <a class="navbar-item" href="{{ url('/') }}">
                <img src="images/logo.png" alt="{{ Voyager::setting('admin_title') }}">
            </a>
            {{--<a class="navbar-item is-hidden-desktop" href="{{ url('/') }}" target="_blank">--}}
                {{--<span class="icon" style="color: #333;"><i class="fa fa-github"></i></span>--}}
            {{--</a>--}}
            {{--<a class="navbar-item is-hidden-desktop" href="https://twitter.com/jgthms" target="_blank">--}}
                {{--<span class="icon" style="color: #55acee;"><i class="fa fa-twitter"></i></span>--}}
            {{--</a>--}}
            <a class="navbar-item is-hidden-desktop">Thanks for Open Source.</a>
            <div class="navbar-burger burger" data-target="navMenuIndex">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>

        <div id="navMenuIndex" class="navbar-menu">
            <div class="navbar-start">
                <a class="navbar-item" href="{{ route('posts.index') }}"><span class="bd-emoji p-r-10">📒</span>Posts</a>
                <a class="navbar-item" href="{{ route('links.index') }}"><span class="bd-emoji p-r-10">🔗</span>Links</a>
                <a class="navbar-item" href="{{ route('search') }}"><span class="bd-emoji p-r-10">🔎</span>Search</a>
            </div>

            <div class="navbar-end">
                @if (Auth::guest())
                    <a href="{{route('login')}}" class="navbar-item">Login</a>
                    <a href="{{route('register')}}" class="navbar-item">Signup</a>
                @else
                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link" href="#">
                            Welcome <strong class="p-l-10">{{ Auth::user()->name }}</strong>
                        </a>
                        <div class="navbar-dropdown is-boxed">
                            {{--<a class="navbar-item" href="#">--}}
                                {{--Form--}}
                            {{--</a>--}}

                            {{--<hr class="navbar-divider">--}}
                            <a class="navbar-item" href="{{route('logout')}}"
                               onclick="event.preventDefault();
                     document.getElementById('logout-form').submit();"><span class="icon"><i
                                            class="fa fa-fw fa-sign-out m-r-5"></i></span>Logout</a>
                            @include('home._includes._forms.logout')
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </div>
</nav>
