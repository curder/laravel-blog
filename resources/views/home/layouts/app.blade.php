<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('page_title') - {{ Voyager::setting('admin_title') }}</title>

    <!-- Styles -->
    <link href="{{ mix('css/app.css') }}" rel="stylesheet">
@yield('style')
<!-- Scripts -->
    <script>
        window.Laravel = <?php echo json_encode([
            'csrfToken' => csrf_token(),
        ]); ?>;
        Laravel.apiToken = "{{ Auth::check() ? 'Bearer '.Auth::user()->api_token : 'Bearer '}}";
        @if(Auth::check())
            window.Zhihu = {
            name: "{{Auth::user()->name}}",
            avatar: "{{Auth::user()->avatar}}"
        }
        @endif
    </script>
</head>
<body>

@include('home._includes._nav.main')
<div id="app">
    @yield('banner')
    @include('flash::message')
    @yield('content')

    @include('home._includes._footer.main')
</div>

<!-- Scripts -->
<script src="{{ mix('js/app.js') }}"></script>
</body>
</html>
