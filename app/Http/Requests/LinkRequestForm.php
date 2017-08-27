<?php

namespace App\Http\Requests;

use App\Link;
use Illuminate\Foundation\Http\FormRequest;

class LinkRequestForm extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'category_id' => 'required|exists:categories,id',
            'name' => 'required',
            'url' => 'required|active_url', // |unique:community_links
        ];
    }

    /**
     * 执行写入操作
     *
     * @throws \App\Exceptions\LinkAlreadySubmitted
     */
    public function persist()
    {
        Link::from(
            auth()->user()
        )->contribute($this->all());
    }
}
