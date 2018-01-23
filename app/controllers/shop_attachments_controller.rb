class ShopAttachmentsController < InheritedResources::Base
  load_and_authorize_resource

  def update
    @shop_attachment = Shop_attachment.find(params[:id])
    respond_to do |format|
      if @shop_attachment.update(shop_attachment_params)
        format.html { redirect_to @shop_attachment.post, notice: 'Shop attachment was successfully updated.' }
      end
    end
  end

  private

    def shop_attachment_params
      params.require(:shop_attachment).permit(:shop_id, :avatar)
    end
end
