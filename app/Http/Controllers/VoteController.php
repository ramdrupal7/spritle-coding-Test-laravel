<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Vote;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class VoteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
    	if (Auth::check()) {
    		$exist = Vote::where('user_id', Auth::user()->id )->first();
    		
    		if(empty($exist)){
    			Vote::create([
    					'comment_id' => $request->input('comment_id'),
    					'user_id' => Auth::user()->id
    			]);
    			
    		}else{
    			
    			$exist->delete();
    		}
    		
    		$count = Vote::where('comment_id', $request->input('comment_id') )->count();
    		return response()->json(['count' => $count]);
    		
    	}
    	
    	return back()->withInput()->with('error','Something wronmg');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function show(Comment $comment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function edit(Comment $comment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Comment $comment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Comment $comment)
    {
        if (Auth::check()) {

            $reply = Vote::where(['comment_id'=>$comment->id]);
            $comment = Comment::where(['user_id'=>Auth::user()->id, 'id'=>$comment->id]);
            if ($reply->count() > 0 && $comment->count() > 0) {
                $reply->delete();
                $comment->delete();
                return 1;
            }else if($comment->count() > 0){
                $comment->delete();
                return 2;
            }else{
                return 3;
            }

        }    
    }
}
