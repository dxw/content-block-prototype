class ContentBlocksController < ApplicationController
  before_action :set_content_block, only: [:show, :update, :destroy]

  def info
    block_type = params.require(:block_type)
    @schema = ContentBlockValidator.schema_for(block_type)
    render json: @schema
  end

  def index
    @content_blocks = ContentBlock.all
  end

  def show
    render json: @content_block
  end

  def new
    block_type = params.require(:block_type)

    @schema = ContentBlockValidator.schema_for(block_type)

    permitted_params = params.permit(@schema["properties"].keys)

    properties = ContentBlockValidator.default_properties(block_type).merge(permitted_params.to_h)
    @content_block = ContentBlock.new(block_type: block_type, properties: properties)
  end

  def create
    block_type = params.require(:content_block).require(:block_type)
    ContentBlockValidator.validate(block_type, properties)
    properties = content_block_params["properties"]

    @content_block = ContentBlock.new(block_type: block_type, properties: properties)

    if @content_block.save
      render json: @content_block, status: :created
    else
      render json: @content_block.errors, status: :unprocessable_entity
    end

  rescue JSON::Schema::ValidationError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def set_content_block
    @content_block = ContentBlock.find(params[:id])
  end

  def content_block_params
    params.require(:content_block).permit("block_type", "properties" => {})
  end
end
