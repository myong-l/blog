class CommentsController < ApplicationController
	def create
		@note =     Note.find(params[:note_id])
		@comment =  @note.comments.create(comment_params)
		redirect_to note_path(@note)
	end

	def destroy
		@note =    Note.find(params[:note_id])
		@comment = @note.comments.find(params[:id])
		@comment.destroy
		redirect_to note_path(@note)
	end

	private
	def comment_params
		params.require(:comment).permit(
			:commenter,
			:body
		)
	end
end
