<#import "blocks/template.ftlh" as t>
<@t.template user>
    <br>
    <h1 style="text-align: center">Мои товары</h1>
    <hr>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить новый товар
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/product/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="productName">Название товара</label>
                <input type="text" required class="form-control"
                       id="productName" name="title">
            </div>
            <div class="form-group">
                <label for="price">Цена товара</label>
                <div class="input-group mb-3">
                    <input type="number" required class="form-control" id="price" name="price">
                    <div class="input-group-append">
                        <span class="input-group-text">₽</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="searchGraphicsCard">Видеокарта</label>
                <select id="searchGraphicsCard" required name="graphics_card" class="form-control">
                    <option value="">Видеокарта не выбрана</option>
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
            <div class="form-group">
                <label for="cpu">ЦП</label>
                <div class="input-group mb-3">
                    <input type="string" required class="form-control" id="cpu" name="cpu">
                    <div class="input-group-append">
                        <span class="input-group-text"></span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="searchRAM">Объём ОЗУ</label>
                <select id="searchRAM" required name="ram" class="form-control">
                    <option value=8>8 Гб</option>
                    <option value=16>16 Гб</option>
                    <option value=32>32 Гб</option>
                    <option value="64">64 Гб</option>
                    <option value="128">128 Гб</option>
                    <option value="256">256 Гб</option>
                    <option value="512">512 Гб</option>
                </select>
            </div>
            <div class="form-group">
                <label for="description">Описание товара</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Первая фотография к товару</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Вторая фотография к товару</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Третья фотография к товару</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
    </div>
    <div class="card-columns">
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">
                    <div class="card-top">
                        <form action="/product/delete/${product.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-danger m-3">
                                Удалить
                            </button>
                        </form>
                    </div>
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