<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Поиск товаров</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="searchGraphicsCard">Видеокарта</label>
                <select id="searchGraphicsCard" required name="graphics_card" class="form-control">
                    <option value="">---</option>
                    <option value="RTX 3060">RTX 3060</option>
                    <option value="RTX 3060 Ti">RTX 3060 Ti</option>
                    <option value="RTX 3070">RTX 3070</option>
                    <option value="RTX 3070 Ti">RTX 3070 Ti</option>
                    <option value="RTX 3080">RTX 3080</option>
                    <option value="RTX 3080 Ti">RTX 3080 Ti</option>
                    <option value="RTX 3090">RTX 3090</option>
                    <option value="RTX 4060 Ti">RTX 4060 Ti</option>
                    <option value="RTX 4070">RTX 4070</option>
                    <option value="RTX 4070 Ti">RTX 4070 Ti</option>
                    <option value="RTX 4080">RTX 4080</option>
                    <option value="RTX 4090">RTX 4090</option>
                </select>
            </div>
            <div class="form-group col-md-2">
                <label for="searchRAM">Объём ОЗУ</label>
                <select id="searchRAM" required name="ram" class="form-control">
                    <option value="0">---</option>
                    <option value=8>8 Гб</option>
                    <option value=16>16 Гб</option>
                    <option value=32>32 Гб</option>
                    <option value="64">64 Гб</option>
                    <option value="128">128 Гб</option>
                    <option value="256">256 Гб</option>
                    <option value="512">512 Гб</option>
                </select>
            </div>
<#--            <div class="form-group col-md-10">-->
<#--                <label for="searchWord">Поиск по объявлениям</label>-->
<#--                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"-->
<#--                       id="searchWord">-->
<#--            </div>-->
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <hr>
    <div class="card-columns">
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">

                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.price} ₽</p>
                    </div>
                    <div class="card-footer">
                        ${product.graphics_card}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>