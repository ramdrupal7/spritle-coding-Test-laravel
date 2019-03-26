@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Dashboard</div>

                <div class="panel-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif
                    <form id="comment-form" method="post" action="{{ route('comments.store') }}" >
                        {{ csrf_field() }}
                        <input type="hidden" name="user_id" value="{{ Auth::user()->id }}" >
                        <div class="row" style="padding: 10px;">
                            <div class="form-group">
                                <textarea class="form-control" name="comment" placeholder="what I did interesting today"></textarea>
                            </div>
                        </div>
                        <div class="row" style="padding: 0 10px 0 10px;">
                            <div class="form-group">
                                <input type="submit" class="btn btn-primary btn-lg" style="width: 100%" name="submit">
                            </div>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="row">
         <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Timeline</div>

                <div class="panel-body comment-container" >
                    
                    @foreach($comments as $comment)
                        <div class="well">
                          <div class="row">
                          	<div class="row">
                          		<div class="col-md-12">
                            		<img src="{{ Avatar::create($comment->name)->setFontSize(20)->setDimension(73,73) }}" />
                            		<i><b> {{ $comment->name }} </b></i>
                            	</div>
                            </div>
                            <div class="row">
                           		<div class="col-md-12">
                            		<span> {{ $comment->comment }} </span>
                            	</div>
                            </div>
                            <br>
                            <div class="row">
	                           	<div class="col-md-4">
	                            	<span>Posted <?php echo $comment->created_at->diffForHumans() ?></span>
	                            </div>
	                            
	                            <div class="col-md-8">
	                            <?php // echo '<pre>'.print_r($comment->vote->count() , true).'</pre>'; ?>
		                          	<a style="cursor: pointer;" comment_id_vote="{{ $comment->id }}" name_a="{{ Auth::user()->name }}"
		                                token="{{ csrf_token() }}" class="vote">
		                                <i class="fa fa-heart"></i> <span id="comment_voting_count_{{ $comment->id }}">{{ $comment->vote->count() }}</span>
		                               <!--  {{ $comment->vote->count() > 1 ? 'votes' : 'vote'}} -->
		                                </a>&nbsp;&nbsp;
		                                
	                            	<i class="fa fa-comment"></i> {{ $comment->replies->count() }}
		                          	<a style="cursor: pointer;" cid="{{ $comment->id }}" name_a="{{ Auth::user()->name }}"
		                                token="{{ csrf_token() }}" class="reply">{{ $comment->replies->count() > 1 ? 'Comments' : 'Comment'}}</a>&nbsp;&nbsp;
		                          
		                          @if(auth()->user()->id == $comment->user_id)
		                            <a style="cursor: pointer; color:red;"  class="delete-comment" token="{{ csrf_token() }}" 
		                                comment-did="{{ $comment->id }}" ><i class="fa fa-trash"></i>&nbsp;Delete</a>
		                          @endif
		                          <br> <br>
		                          <div class="reply-form">
                                    
                                    <!-- Dynamic Reply form -->
                                    
                                </div>
	                            </div>
                            </div>
                            
                            <div style="margin-left:10px;" class="row">
                            	
                                
                                @foreach($comment->replies as $rep)
                                     @if($comment->id === $rep->comment_id)
                                        <div class="wellinside">
                                        	<img src="{{ Avatar::create($rep->name)->setFontSize(10)->setDimension(35,35) }}" />
                                            <i><b> {{ $rep->name }} </b></i><br>
                                            <span> {{ $rep->reply }} </span>
                                            <div style="margin-left:10px; float:right;">
                                            
                                            <!-- 
                                            	<a rname="{{ Auth::user()->name }}" rid="{{ $comment->id }}" 
                                                	style="cursor: pointer;" class="reply-to-reply" 
                                                	token="{{ csrf_token() }}">Reply</a>&nbsp;  -->
                                                
                                                @if(auth()->user()->id == $rep->user_id)
                                                <a style="cursor: pointer; color:red;" did="{{ $rep->id }}" class="delete-reply" 
                                                	token="{{ csrf_token() }}" ><i class="fa fa-trash"></i>&nbsp;Delete</a>
                                                @endif
                                            </div>
                                            
                                            <div class="reply-to-reply-form">
                                    
                                                <!-- Dynamic Reply form -->
                                                
                                            </div>
                                            
                                        </div>
                                    @endif 
                                @endforeach
                                
                            </div>
                          </div>
                        </div>
                    @endforeach

                </div>
            </div>
        </div>
    </div>

   

</div>
@endsection

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="{{ asset('/js/main.js') }}">
  
</script>


