<template>
    <form action="">
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">Add New</p>
            </header>
            <section class="modal-card-body">
            <b-field label="Simple">
                <b-select placeholder="Select a Channel" required>
                <option
                    v-for="option in options"
                    :value="option.id"
                    :key="option.id">
                    {{ option.first_name }}
                </option>
                </b-select>
            </b-field>
                <b-field label="Name">
                    <b-input
                        type="name"
                        v-model="name"
                        placeholder="What is the name of your article?"
                        required>
                    </b-input>
                </b-field>

                <b-field label="URL">
                    <b-input
                        type="url"
                        v-model="url"
                        placeholder="What is the URL?"
                        required>
                    </b-input>
                </b-field>

            </section>
            <footer class="modal-card-foot">
                <button class="button" type="button" @click="$parent.close()">Close</button>
                <button class="button is-primary">Create</button>
            </footer>
        </div>
    </form>
</template>

<script>
    export default {
        props: ['category_id','name', 'url']
    }
</script>

<style scoped>
    /*.modal-card {
        width: auto;
    }*/
</style>
