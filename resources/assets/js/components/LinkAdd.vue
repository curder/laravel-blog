<template>
    <section>
        <button class="button is-large is-info" @click="isComponentModalActive = true">Add</button>
        <b-modal :active.sync="isComponentModalActive" has-modal-card>
            <modal-form v-bind="formProps" @completed="addLink"></modal-form>
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
//                    category_id: '',
//                    name: '',
//                    url: '',
//                    description: '',
                }
            }
        },
        methods: {
            addLink(response) {
                if (response.title) {
                    this.$dialog.alert({
                        title: response.title,
                        message: response.message,
                        confirmText: 'OK',
                        type: response.type
                    });
                } else {
                    this.$toast.open({
                        message: response.message,
                        type: response.type
                    });
                }
                this.isComponentModalActive = false; // close dialog.
            }
        },
    }
</script>
