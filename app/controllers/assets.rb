class Assets < Application
  # provides :xml, :yaml, :js

  def index
    @assets = Asset.all
    display @assets
  end

  def show(id)
    @asset = Asset.get(id)
    raise NotFound unless @asset
    display @asset
  end

  def new
    only_provides :html
    @asset = Asset.new
    display @asset
  end

  def edit(id)
    only_provides :html
    @asset = Asset.get(id)
    raise NotFound unless @asset
    display @asset
  end

  def create(asset)
    @asset = Asset.new(asset)
    if @asset.save
      redirect resource(@asset), :message => {:notice => "Asset was successfully created"}
    else
      message[:error] = "Asset failed to be created"
      render :new
    end
  end

  def update(id, asset)
    @asset = Asset.get(id)
    raise NotFound unless @asset
    if @asset.update_attributes(asset)
       redirect resource(@asset)
    else
      display @asset, :edit
    end
  end

  def destroy(id)
    @asset = Asset.get(id)
    raise NotFound unless @asset
    if @asset.destroy
      redirect resource(:assets)
    else
      raise InternalServerError
    end
  end

end # Assets
