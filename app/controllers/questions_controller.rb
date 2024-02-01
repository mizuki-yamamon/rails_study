class QuestionsController < ApplicationController
    # 質問一覧表示
    def index
        #Questionモデルを全件取得
        @questions = Question.all
    end

    #質問詳細ページ表示
    def show
        @question = Question.find(params[:id])

    end

    #質問の新規作成
    def new
        @question = Question.new
    end

    #質問の登録
    def create
        #Questionモデルを初期化
        @question = Question.new(question_params)
        #Questionモデルを保存
        if @question.save
            #質問一覧ページにリダイレクト
            redirect_to @question
        else
            #新規登録ページを再表示
            render :new, status: :unprocessable_entity
        end
        
    end

    # 質問の編集
    def edit
        @question = Question.find(params[:id])
    end

    #質問の更新
    def update
        @question = Question.find(params[:id])
        if @question.update(question_params)
            redirect_to @question
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    # 質問の削除
    def destroy
        @question = Question.find(params[:id])
        @question.destroy
        redirect_to questions_path
    end

    private
    def question_params
        params.require(:question).permit(:title, :name, :content)
    end
end
