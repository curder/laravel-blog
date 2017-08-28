class Category {
    static all(then) {
        return axios.get('/api/categories')
            .then(({data}) => then(data));
    }
}
export default Category;
