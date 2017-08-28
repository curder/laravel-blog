<template>
    <form action="#" @submit.prevent="onSubmit" @keydown="form.errors.clear($event.target.name)">
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">Add New</p>
            </header>
            <section class="modal-card-body">
                <b-field label="Channel">
                    <b-select placeholder="Select a Channel" v-model="form.category_id">
                        <option v-for="category in categories"
                                :value="category.id">
                            {{ category.name }}

                        </option>
                    </b-select>
                </b-field>
                <span class="help is-danger"
                      v-if="form.errors.has('category_id')"
                      v-text="form.errors.get('category_id')"></span>
                <b-field label="Name">
                    <b-input v-model="form.name"
                             placeholder="What is the name of your article?">
                    </b-input>
                </b-field>
                <span class="help is-danger"
                      v-if="form.errors.has('name')"
                      v-text="form.errors.get('name')"></span>

                <b-field label="URL">
                    <b-input v-model="form.url"
                             type="url"
                             placeholder="What is the URL?">
                    </b-input>
                </b-field>
                <span class="help is-danger"
                      v-if="form.errors.has('url')"
                      v-text="form.errors.get('url')"></span>

                <b-field label="Description">
                    <b-input v-model="form.description"
                             maxlength="200"
                             placeholder="The description for the URL is an optional."
                             type="textarea"></b-input>
                </b-field>
                <span class="help is-danger"
                      v-if="form.errors.has('description')"
                      v-text="form.errors.get('description')"></span>
            </section>
            <footer class="modal-card-foot">
                <button class="button" type="button" @click="$parent.close()">Close</button>
                <button class="button is-primary" :disabled="form.errors.any()">Create</button>
            </footer>
        </div>
    </form>
</template>

<script>
    import Category from '../models/Category';
    export default {
//        props: ['category_id', 'name', 'url', 'description'],
        data() {
            return {
                categories: [],

                form: new Form({
                    'category_id': null,
                    'name': '',
                    'url': '',
                    'description': ''
                }),
            }
        },
        created() {
            Category.all(categories => this.categories = categories);
        },
        methods: {
            onSubmit() {
                this.form.post('/api/links')
                    .then(response => this.$emit('completed', response));
            }
        }
    }
</script>

<style scoped>
    /*.modal-card {
        width: auto;
    }*/
</style>
