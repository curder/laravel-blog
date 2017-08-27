@if(auth()->check())
    <div class="col-md-4">
        <h3>Contribute a link</h3>
        <div class="panel panel-default">
            <div class="panel-body">
                <form action="{{ route('links.store') }}" method="post">
                    {{ csrf_field() }}
                    <div class="form-group {{ $errors->has('category_id') ? 'has-error' : '' }}">
                        <label for="category_id">Channel</label>
                        <select name="category_id" id="category_id" class="form-control">
                            <option disabled selected>Pick a Channel...</option>
                            @foreach($categories as $category)
                                <option value="{{ $category->id }}" {{ old('category_id') == $category->id ? 'selected' :'' }}>
                                    {{ $category->name }}
                                </option>
                            @endforeach
                        </select>
                        {!! $errors->first('category_id', '<span class="help-block">:message</span>') !!}
                    </div>

                    <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" required value="{{ old('name') }}"
                               name="name" placeholder="What is the name of your article?"/>
                        {!! $errors->first('name', '<span class="help-block">:message</span>') !!}
                    </div>
                    <div class="form-group {{ $errors->has('url') ? 'has-error' : '' }}">
                        <label for="url">Link</label>
                        <input type="text" class="form-control" id="url" name="url" required value="{{ old('url') }}"
                               placeholder="What is the URL?"/>
                        {!! $errors->first('url', '<span class="help-block">:message</span>') !!}
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary">Contribute Link</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endif
