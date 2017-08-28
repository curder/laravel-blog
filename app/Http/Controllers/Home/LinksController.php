<?php

namespace App\Http\Controllers\Home;

use App\Category;
use App\Exceptions\LinkAlreadySubmitted;
use App\Http\Controllers\Controller;
use App\Http\Requests\LinkCreateRequest;
use App\Queries\LinksQuery;

class LinksController extends Controller
{

    public function index(Category $category = null)
    {
        $links = (new LinksQuery)->get(
            request()->exists('popular'), $category
        );

        $categories = Category::orderBy('name', 'asc')->get();

        return view('home.links.index', compact('links', 'categories', 'category'));
    }

    public function store(LinkCreateRequest $form)
    {
        try {
            $form->persist();
            if (auth()->user()->isTrusted()) {
                flash('Thank you for the contribute!', 'success');
            } else {
                flash()->overlay('This contribute will be approved shortly.', 'Thanks!');
            }
        } catch (LinkAlreadySubmitted $e) {
            flash()->overlay(
                "We'll instead bump the timestamps and bring that link back to the top. Thanks!",
                'That Link Has Already Been Submitted'
            );
        }

        return back();
    }
}
