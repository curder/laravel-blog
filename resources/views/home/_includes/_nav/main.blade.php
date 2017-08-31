<nav class="navbar is-transparent">
    <div class="container">
        <div class="navbar-brand">
            <a class="navbar-item" href="{{ url('/') }}">
                <img src="images/blog_logo.png" alt="{{ Voyager::setting('admin_title') }}" width="112" height="28">
            </a>
            <a class="navbar-item is-hidden-desktop" href="{{ url('/') }}" target="_blank">
                <span class="icon" style="color: #333;"><i class="fa fa-github"></i></span>
            </a>
            <a class="navbar-item is-hidden-desktop" href="https://twitter.com/jgthms" target="_blank">
                <span class="icon" style="color: #55acee;"><i class="fa fa-twitter"></i></span>
            </a>
            <div class="navbar-burger burger" data-target="navMenuIndex">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>

        <div id="navMenuIndex" class="navbar-menu">
            <div class="navbar-start">
                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link" href="#">
                        Docs
                    </a>
                    <div class="navbar-dropdown is-boxed">
                        <a class="navbar-item" href="#">
                            Layout
                        </a>
                        <a class="navbar-item" href="#">
                            Form
                        </a>

                        <hr class="navbar-divider">
                        <div class="navbar-item">
                            <div>
                                <p class="is-size-6-desktop">
                                    <strong class="has-text-info">0.5.1</strong>
                                </p>
                                <small>
                                    <a class="bd-view-all-versions" href="/versions">View all versions</a>
                                </small>
                            </div>
                        </div>
                    </div>
                </div>

                <a class="navbar-item" href="/posts">Posts</a>
                <a class="navbar-item" href="/links">Links</a>
                <a class="navbar-item" href="/pages">Pages</a>

                @section('search')
                    <div class="level-item">
                        <form action="{{route('search')}}">
                            <div class="field has-addons">
                                <p class="control">
                                    <input class="input" type="text" name="keyword" placeholder="keywords">
                                </p>
                                <p class="control">
                                    <button class="button">Search</button>
                                </p>
                            </div>
                        </form>
                    </div>
                @show
            </div>

            <div class="navbar-end">
                @if (Auth::guest())
                    <a href="{{route('login')}}" class="navbar-item">Login</a>
                    <a href="{{route('register')}}" class="navbar-item">Signup</a>
                @else
                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link" href="#">
                            {{ Auth::user()->name }}
                        </a>
                        <div class="navbar-dropdown is-boxed">
                            <a class="navbar-item" href="#">
                                Form
                            </a>

                            <hr class="navbar-divider">
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
