<template>
    <section>
    <button class="button is-large is-info" @click="isComponentModalActive = true">
    Add</button>

        <b-modal :active.sync="isComponentModalActive" has-modal-card>
            <modal-form v-bind="formProps"></modal-form>
        </b-modal>
    </section>
</template>
<script>
    import ModalForm from '../components/LinkModelForm'

    export default {
        components: {
            ModalForm
        },
        data() {
            return {
                isComponentModalActive: false,
                formProps: {
                category_id:'',
                    name: '',
                    url: '',
                }
            }
        }
    }
</script>
