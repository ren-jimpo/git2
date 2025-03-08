class HomeController < ApplicationController
    def top
        # データベースから動物データを取得する（登録日時の新しい順）
        @animals = AnimalEntry.all.order(created_at: :desc)
    end

    def add
        # フォーム表示用
        @animal = AnimalEntry.new
    end    
    
    def create
        # POSTリクエストを処理するアクション
        @animal = AnimalEntry.new(animal_params)
        
        if @animal.save
            flash[:notice] = "「#{@animal.name}」が追加されました"
            redirect_to home_top_path
        else
            # バリデーションエラーがある場合はフォームを再表示
            flash.now[:alert] = "入力内容に問題があります。エラーメッセージを確認してください。"
            render :add, status: :unprocessable_entity
        end
    end

    private

    def animal_params
        # Strong Parametersを使用してパラメータをフィルタリング
        # モデル名でネストされたパラメータか、直接送られてきたパラメータの両方に対応
        if params[:animal_entry].present?
            params.require(:animal_entry).permit(:name, :scientific_name, :habitat, :characteristics)
        else
            params.permit(:name, :scientific_name, :habitat, :characteristics)
        end
    end
end

