#pragma once
template <typename T>
class IteratorVectorT;

template <typename T>
class Lista{
    T* data;
    unsigned int max_size = 10;
    unsigned int length;
    void extend();
public:
    Lista();

    Lista(const Lista &o);

    ~Lista();

    T& operator[](int i);

    Lista& operator=(const Lista& o);

    Lista(Lista&& o);

    Lista& operator=(Lista&& ot);

    T getData(unsigned int _index);

    void push(T _newData);

    void set(int poz, const T& el);

    const unsigned int size() const;

    void erase(int poz);

    friend class IteratorVectorT<T>;

    IteratorVectorT<T> begin();
    IteratorVectorT<T> end();
};

template <typename T>
T& Lista<T>::operator[](int i) {
    return data[i];
}


template <typename T>
void Lista<T>::extend(){
    T* newData = new T [max_size*2];
    for(int i=0;i<max_size;i++){
        newData[i] = data[i];
    }
    delete [] data;
    data = newData;
    max_size *=2;
}

template <typename T>
Lista<T>::Lista(){
    data = new T [max_size];
    length = 0;
}

template<typename T>
Lista<T>::Lista(const Lista<T>& o) {
    data = new T[o.max_size];
    //copiez elementele
    for (int i = 0; i < o.length; i++) {
        data[i] = o.data[i];  //assignment din Pet
    }
    length = o.length;
    max_size = o.max_size;
}

template<typename T>
Lista<T>& Lista<T>::operator=(const Lista<T>& o) {
    if (this == &o) {
        return *this;//s-a facut l=l;
    }
    delete[] data;
    data = new T[o.max_size];
    //copiez elementele
    for (int i = 0; i < o.length; i++) {
        data[i] = o.data[i];  //assignment din Pet
    }
    length = o.length;
    max_size = o.max_size;
    return *this;
}

template <typename T>
Lista<T>::~Lista(){
    delete [] data;
}

template<typename T>
Lista<T>::Lista(Lista&& o) {
    // Copy the data pointer from other
    data = o.data;
    length = o.length;
    max_size = o.max_size;

    // Release the data pointer from the source object so that
    // the destructor does not free the memory multiple times.
    o.data = nullptr;
    o.length = 0;
    o.max_size = 0;
}

template<typename T>
Lista<T>& Lista<T>::operator=(Lista<T>&& o) {
    if (this == &o) {
        return *this;
    }
    delete[] data;
    // Copy the data pointer from other
    data = o.data;
    length = o.length;
    max_size = o.max_size;

    // Release the data pointer from the source object so that
    // the destructor does not free the memory multiple times.
    o.data = nullptr;
    o.length = 0;
    o.max_size = 0;
    return *this;
}

template<typename T>
IteratorVectorT<T> Lista<T>::begin()
{
    return IteratorVectorT<T>(*this);
}

template<typename T>
IteratorVectorT<T> Lista<T>::end()
{
    return IteratorVectorT<T>(*this, length);
}

template <typename T>
void Lista<T>::push(T _newData){
    if(length==max_size)
        extend();
    data[length] = _newData;
    length++;
}

template <typename T>
const unsigned int Lista<T>::size() const { return length; }

template <typename T>
T Lista<T>::getData(unsigned int _index){
    return data[_index];
}

template<typename T>
void Lista<T>::set(int poz, const T& el) {
    data[poz] = el;
}

template <typename T>
void Lista<T>::erase(int poz) {
    for (int i = poz; i < length-1; i++) {
        data[i] = data[i + 1];
    }
    length--;
}

template<typename ElementT>
class IteratorVectorT {
private:
    const Lista<ElementT>& v;
    int poz = 0;
public:
    IteratorVectorT(const Lista<ElementT>& v) noexcept;
    IteratorVectorT(const Lista<ElementT>& v, int poz)noexcept;
    bool valid()const;
    ElementT& element() const;
    void next();
    ElementT& operator*();
    IteratorVectorT& operator++();
    bool operator==(const IteratorVectorT& ot)noexcept;
    bool operator!=(const IteratorVectorT& ot)noexcept;
};

template<typename ElementT>
IteratorVectorT<ElementT>::IteratorVectorT(const Lista<ElementT>& v) noexcept:v{ v } {}

template<typename ElementT>
IteratorVectorT<ElementT>::IteratorVectorT(const Lista<ElementT>& v, int poz)noexcept : v{ v }, poz{ poz } {}

template<typename ElementT>
bool IteratorVectorT<ElementT>::valid()const {
    return poz < v.lg;
}

template<typename ElementT>
ElementT& IteratorVectorT<ElementT>::element() const {
    return v.data[poz];
}

template<typename ElementT>
void IteratorVectorT<ElementT>::next() {
    poz++;
}

template<typename ElementT>
ElementT& IteratorVectorT<ElementT>::operator*() {
    return element();
}

template<typename ElementT>
IteratorVectorT<ElementT>& IteratorVectorT<ElementT>::operator++() {
    next();
    return *this;
}

template<typename ElementT>
bool IteratorVectorT<ElementT>::operator==(const IteratorVectorT<ElementT>& ot) noexcept {
    return poz == ot.poz;
}

template<typename ElementT>
bool IteratorVectorT<ElementT>::operator!=(const IteratorVectorT<ElementT>& ot)noexcept {
    return !(*this == ot);
}
