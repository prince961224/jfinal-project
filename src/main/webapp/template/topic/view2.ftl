<#-- @ftlvariable name="topic" type="java.util.List<model.Topic>" -->
<@override name="head">
    <@super/>
    <script src="${base}/scripts/vue.min.js"></script>
    <script src="${base}/scripts/vue-resource.min.js"></script>
</@override>

<@override name="main-content">
<div class="ui sixteen wide column" id="main-content">
    <div class="ui basic segment">
        <h1>${(topic.title)!'无标题'}</h1>

        <div class="ui basic segment">
            <p style="font-size:1.1rem;text-indent: 2rem;">${(topic.content)!'无内容'}</p>
        </div>
        <div class="ui divider"></div>


        <div class="ui divided items">

            <div class="ui inverted dimmer" id="dimmer">
                <div class="ui text loader">正在加载...</div>
            </div>
            <div class="item" v-for="reply in replies">

                <div class="ui tiny image" style="width:120px;">
                    <img class="ui avatar image" src="${base}/images/stevie.jpg">
                    <div style="text-align: center;">${replies.nickname}</div>
                </div>

                <div class="ui basic segment content" style="min-height: 50px;">

                    <p style="font-size:1.1rem;text-indent: 2rem;">${replies.content}</p>

                    <div class="right floated description" style="font-weight: bold">
                        -- 回复于&nbsp;${replies.pub_date}
                    </div>
                </div>

            </div>


        </div>

        <div class="ui center aligned basic segment">
            <div class="ui pagination menu">
                <a @click="previousPage" v-if="pageNumber!=1" class="item">
                    <i class="left chevron icon"></i></a>
                <span class="item">{{pageNumber}}</span>
                <a @click="nextPage" v-if="!lastPage" class="item">
                    <i class="right chevron icon"></i></a>
                </a>
            </div>

        </div>


        <#if (session.user)??>

            <form action="${base}/topic/reply" method="post">
                <input type="hidden" name="user_id" value="${session.user.id}">
                <input type="hidden" name="topic_id" value="${topic.id}">
                内容: <textarea cols="70" rows="10" name="content"></textarea> <br>
                <input type="submit" value="回复">

            </form>
        <#else>
            <span style="color:red;">请<a href="${base}/login">登录</a>后再回复</span>
        </#if>

    </div>
</div>



</@override>
<@override name="additional">
    <@super/>
    <script>
        var vm = new Vue({
            el: '#main-content',
            data: {
                replies: [],
                getRepliesUrl: '${base}/topic/replies',
                pageNumber: 1,
                lastPage: false,
                firstPage: true,
                topicId: ${(topic.id)!'-1'},
                totalPage: 1
            },
            mounted: function () {
                this.getReplies(1);
            },

            methods: {
                getReplies: function (pageNumber) {

                    var _this = this;
                    $('#dimmer').addClass("active");
                    this.$http.post(this.getRepliesUrl, {
                        topicId: this.topicId,
                        pageNumber: pageNumber
                    }, {emulateJSON: true}).then(function (res) {

                                _this.replies = res.data.list;
                                _this.pageNumber = res.data.pageNumber;
                                _this.lastPage = res.data.lastPage;
                                _this.firstpage = res.data.firstpage;
                                _this.totalPage = res.data.totalPage;
                                $('#dimmer').removeClass("active");
                            },
                            function () {

                            }
                    );

                },
                nextPage: function () {
                    this.getReplies(this.pageNumber + 1);
                },
                previousPage: function () {
                    this.getReplies(this.pageNumber - 1);
                }


            }
        });

    </script>
</@override>
<@extends name="../parent.ftl"></@extends>