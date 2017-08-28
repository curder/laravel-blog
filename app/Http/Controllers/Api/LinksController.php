<?php

namespace App\Http\Controllers\Api;

use App\Exceptions\LinkAlreadySubmitted;
use App\Http\Controllers\Controller;
use App\Http\Requests\LinkCreateRequest;

class LinksController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(LinkCreateRequest $request)
    {
        $title = '';
        try {
            $user = user('api');
            $request->persist($user);
            if ($user->isTrusted()) {
                $type = 'is-success';
                $message = 'Thank you for the contribute!';
            } else {
                $type = 'is-danger';
                $message = 'This contribute will be approved shortly.';
            }
        } catch (LinkAlreadySubmitted $e) {
            $type = 'is-danger';
            $title = 'That Link Has Already Been Submitted';
            $message = 'We\'ll instead bump the timestamps and bring that link back to the top. Thanks!';
        }

        return response()->json(['message' => $message, 'type' => $type, 'title' => $title]);
    }
}
